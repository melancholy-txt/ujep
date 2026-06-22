import pandas as pd
import streamlit as st

from .constants import CITY_COL, GENDER_COL, SCHOOL_COL, TIME_COL, VISITOR_COL


def build_sidebar_filters(
    data: pd.DataFrame,
    program_table: pd.DataFrame,
    subject_table: pd.DataFrame,
) -> dict[str, object]:
    st.sidebar.header("Filtry")

    mode = st.sidebar.radio(
        "Režim dat",
        options=["Relevantní sloupce", "Vtipné sloupce", "Obojí"],
        index=0,
    )

    # min_time = data[TIME_COL].min().to_pydatetime()
    # max_time = data[TIME_COL].max().to_pydatetime()
    # time_range = st.sidebar.slider(
    #     "Čas návštěvy",
    #     min_value=min_time,
    #     max_value=max_time,
    #     value=(min_time, max_time),
    #     format="HH:mm",
    # )

    genders = sorted(data[GENDER_COL].dropna().unique().tolist())
    cities = sorted(data[CITY_COL].dropna().unique().tolist())
    schools = sorted(data[SCHOOL_COL].dropna().unique().tolist())
    sources = sorted(data["source_group"].dropna().unique().tolist())
    programs = sorted(program_table["Obor"].dropna().unique().tolist())
    subjects = sorted(subject_table["Předmět"].dropna().unique().tolist())

    filters = {
        "mode": mode,
        # "time_range": time_range,
        "genders": st.sidebar.multiselect("Pohlaví", genders, default=genders),
        "cities": st.sidebar.multiselect("Místo bydliště", cities, default=cities),
        "schools": st.sidebar.multiselect("Studovaná škola", schools, default=schools),
        "sources": st.sidebar.multiselect("Zdroj informace", sources, default=sources),
        "programs": st.sidebar.multiselect("Zájem o obor", programs, default=[]),
        "subjects": st.sidebar.multiselect("Předměty u učitelství", subjects, default=[]),
    }

    st.sidebar.caption(
        "Všechny vizualizace sdílí stejné filtry. Vyberte obor/předmět pro drilldown detail."
    )
    return filters


def apply_filters(
    data: pd.DataFrame,
    program_table: pd.DataFrame,
    subject_table: pd.DataFrame,
    filters: dict[str, object],
) -> tuple[pd.DataFrame, pd.DataFrame, pd.DataFrame]:
    # start_time, end_time = filters["time_range"]
    mask = (data[TIME_COL] >= pd.Timestamp(start_time)) & (data[TIME_COL] <= pd.Timestamp(end_time))

    for column_name, selected_values in (
        (GENDER_COL, filters["genders"]),
        (CITY_COL, filters["cities"]),
        (SCHOOL_COL, filters["schools"]),
        ("source_group", filters["sources"]),
    ):
        if selected_values:
            mask &= data[column_name].isin(selected_values)
        else:
            mask &= False

    filtered_data = data[mask].copy()

    if filters["programs"]:
        valid_visitors = set(
            program_table[
                (program_table[VISITOR_COL].isin(filtered_data[VISITOR_COL]))
                & (program_table["Obor"].isin(filters["programs"]))
            ][VISITOR_COL].unique()
        )
        filtered_data = filtered_data[filtered_data[VISITOR_COL].isin(valid_visitors)].copy()

    if filters["subjects"]:
        valid_visitors = set(
            subject_table[
                (subject_table[VISITOR_COL].isin(filtered_data[VISITOR_COL]))
                & (subject_table["Předmět"].isin(filters["subjects"]))
            ][VISITOR_COL].unique()
        )
        filtered_data = filtered_data[filtered_data[VISITOR_COL].isin(valid_visitors)].copy()

    filtered_programs = program_table[program_table[VISITOR_COL].isin(filtered_data[VISITOR_COL])].copy()
    filtered_subjects = subject_table[subject_table[VISITOR_COL].isin(filtered_data[VISITOR_COL])].copy()

    if filters["programs"]:
        filtered_programs = filtered_programs[filtered_programs["Obor"].isin(filters["programs"])]
    if filters["subjects"]:
        filtered_subjects = filtered_subjects[filtered_subjects["Předmět"].isin(filters["subjects"])]

    return filtered_data, filtered_programs, filtered_subjects
