import pandas as pd
import plotly.express as px
import streamlit as st

from .charts import build_wordcloud_figure
from .constants import (
    CITY_COL,
    FAVICON_PATH,
    GENDER_COL,
    IMPORTANT_COL,
    LOGO_PATH,
    PET_COL,
    PROGRAM_COL,
    SCHOOL_COL,
    SHOE_COL,
    SOURCE_COL,
    SUBJECT_COL,
    TIME_COL,
    VISITOR_COL,
)
from .text_processing import extract_keywords


def render_header() -> None:
    left_col, right_col = st.columns([4.2, 1])
    with left_col:
        st.markdown(
            '<div class="dashboard-title">Den otevřených dveří PřF UJEP 2026</div>',
            unsafe_allow_html=True,
        )
        st.markdown(
            '<div class="dashboard-subtitle">Interaktivní dashboard návštěvnosti a preferencí uchazečů<br><b>Autor:</b> Antonín Višňák</div>',
            unsafe_allow_html=True,
        )

    with right_col:
        if LOGO_PATH.exists():
            st.image(str(LOGO_PATH), use_container_width=True)
        else:
            st.warning("Logo PřF UJEP nebylo nalezeno v image/PRF.")


def render_kpis(data: pd.DataFrame, programs: pd.DataFrame) -> None:
    if data.empty:
        st.info("Po aktuálním filtrování nejsou dostupná data.")
        return

    timeline = data.groupby("time_slot", as_index=False).size().rename(columns={"size": "Počet návštěvníků"})
    peak_label = "-"
    peak_value = 0
    if not timeline.empty:
        peak_row = timeline.sort_values("Počet návštěvníků", ascending=False).iloc[0]
        peak_label = pd.Timestamp(peak_row["time_slot"]).strftime("%H:%M")
        peak_value = int(peak_row["Počet návštěvníků"])

    source_counts = data["source_group"].value_counts()
    top_source = source_counts.index[0] if not source_counts.empty else "-"

    program_counts = programs["Obor"].value_counts()
    top_program = program_counts.index[0] if not program_counts.empty else "-"

    m1, m2, m3, m4 = st.columns(4)
    m1.metric("Návštěvníci", int(data[VISITOR_COL].nunique()))
    m2.metric("Špička návštěvnosti", f"{peak_label} ({peak_value})")
    m3.metric("Nejsilnější zdroj", top_source)
    m4.metric("Nejžádanější obor", top_program)


def render_relevant_section(data: pd.DataFrame, programs: pd.DataFrame, subjects: pd.DataFrame) -> None:
    st.markdown('<div class="panel-card">', unsafe_allow_html=True)
    st.subheader("Návštěvnost v čase")
    timeline = data.groupby("time_slot", as_index=False).size().rename(columns={"size": "Počet návštěvníků"})
    if timeline.empty:
        st.info("Pro vybrané filtry nejsou data o návštěvnosti.")
    else:
        timeline = timeline.sort_values("time_slot")
        fig_time = px.area(
            timeline,
            x="time_slot",
            y="Počet návštěvníků",
            markers=True,
            template="plotly_white",
            color_discrete_sequence=["#005b96"],
        )
        fig_time.update_layout(
            xaxis_title="Čas",
            yaxis_title="Počet návštěvníků",
            margin={"l": 10, "r": 10, "t": 10, "b": 10},
            height=320,
        )
        st.plotly_chart(fig_time, use_container_width=True)
    st.markdown("</div>", unsafe_allow_html=True)

    st.markdown('<div class="panel-card">', unsafe_allow_html=True)
    st.subheader("Struktura návštěvníků")
    col1, col2, col3 = st.columns(3)

    with col1:
        gender_counts = data[GENDER_COL].value_counts().reset_index()
        gender_counts.columns = ["Pohlaví", "Počet"]
        fig_gender = px.bar(
            gender_counts,
            x="Pohlaví",
            y="Počet",
            template="plotly_white",
            color="Pohlaví",
            color_discrete_sequence=px.colors.qualitative.Set2,
        )
        fig_gender.update_layout(showlegend=False, height=320, margin={"l": 10, "r": 10, "t": 10, "b": 10})
        st.plotly_chart(fig_gender, use_container_width=True)

    with col2:
        city_counts = data[CITY_COL].value_counts().reset_index()
        city_counts.columns = ["Místo bydliště", "Počet"]
        fig_city = px.bar(
            city_counts,
            x="Počet",
            y="Místo bydliště",
            orientation="h",
            template="plotly_white",
            color="Počet",
            color_continuous_scale="Tealgrn",
        )
        fig_city.update_layout(height=320, margin={"l": 10, "r": 10, "t": 10, "b": 10}, coloraxis_showscale=False)
        st.plotly_chart(fig_city, use_container_width=True)

    with col3:
        school_counts = data[SCHOOL_COL].value_counts().reset_index()
        school_counts.columns = ["Studovaná škola", "Počet"]
        fig_school = px.bar(
            school_counts,
            x="Studovaná škola",
            y="Počet",
            template="plotly_white",
            color="Studovaná škola",
            color_discrete_sequence=px.colors.qualitative.Bold,
        )
        fig_school.update_layout(showlegend=False, height=320, margin={"l": 10, "r": 10, "t": 10, "b": 10})
        st.plotly_chart(fig_school, use_container_width=True)
    st.markdown("</div>", unsafe_allow_html=True)

    st.markdown('<div class="panel-card">', unsafe_allow_html=True)
    st.subheader("Zdroje informací a zájem o obory")
    col4, col5 = st.columns([1.15, 1.85])

    with col4:
        source_counts = data["source_group"].value_counts().reset_index()
        source_counts.columns = ["Zdroj", "Počet"]
        fig_source = px.pie(
            source_counts,
            names="Zdroj",
            values="Počet",
            hole=0.5,
            template="plotly_white",
            color_discrete_sequence=px.colors.qualitative.Vivid,
        )
        fig_source.update_layout(height=360, margin={"l": 10, "r": 10, "t": 10, "b": 10})
        st.plotly_chart(fig_source, use_container_width=True)

    with col5:
        program_counts = programs["Obor"].value_counts().head(10).reset_index()
        program_counts.columns = ["Obor", "Počet"]
        fig_programs = px.bar(
            program_counts,
            x="Počet",
            y="Obor",
            orientation="h",
            template="plotly_white",
            color="Počet",
            color_continuous_scale="Blues",
        )
        fig_programs.update_layout(
            height=360,
            margin={"l": 10, "r": 10, "t": 10, "b": 10},
            coloraxis_showscale=False,
            yaxis={"categoryorder": "total ascending"},
        )
        st.plotly_chart(fig_programs, use_container_width=True)
    st.markdown("</div>", unsafe_allow_html=True)

    st.markdown('<div class="panel-card">', unsafe_allow_html=True)
    st.subheader("Propojení škola × obor a zájem o učitelské předměty")
    col6, col7 = st.columns([1.5, 1])

    with col6:
        top_program_labels = programs["Obor"].value_counts().head(6).index.tolist()
        heatmap_data = programs[programs["Obor"].isin(top_program_labels)].pivot_table(
            index=SCHOOL_COL,
            columns="Obor",
            values=VISITOR_COL,
            aggfunc="count",
            fill_value=0,
        )
        if heatmap_data.empty:
            st.info("Pro heatmapu nejsou po filtraci k dispozici data.")
        else:
            fig_heatmap = px.imshow(
                heatmap_data,
                labels={"x": "Obor", "y": "Škola", "color": "Počet"},
                text_auto=True,
                aspect="auto",
                color_continuous_scale="Mint",
            )
            fig_heatmap.update_layout(height=360, margin={"l": 10, "r": 10, "t": 10, "b": 10})
            st.plotly_chart(fig_heatmap, use_container_width=True)

    with col7:
        if subjects.empty:
            st.info("U učitelských oborů zatím nejsou po filtraci dostupné předměty.")
        else:
            subject_counts = subjects["Předmět"].value_counts().reset_index()
            subject_counts.columns = ["Předmět", "Počet"]
            fig_subjects = px.bar(
                subject_counts,
                x="Počet",
                y="Předmět",
                orientation="h",
                template="plotly_white",
                color="Počet",
                color_continuous_scale="Sunset",
            )
            fig_subjects.update_layout(
                height=360,
                margin={"l": 10, "r": 10, "t": 10, "b": 10},
                coloraxis_showscale=False,
                yaxis={"categoryorder": "total ascending"},
            )
            st.plotly_chart(fig_subjects, use_container_width=True)
    st.markdown("</div>", unsafe_allow_html=True)

    st.markdown('<div class="panel-card">', unsafe_allow_html=True)
    st.subheader("Highlights: Co je pro uchazeče důležité při výběru školy")
    keywords = extract_keywords(data[IMPORTANT_COL], limit=40)
    col8, col9 = st.columns([1.45, 1])

    with col8:
        fig_cloud = build_wordcloud_figure(keywords)
        st.plotly_chart(fig_cloud, use_container_width=True)

    with col9:
        if keywords.empty:
            st.info("Po filtraci nejsou dostupná slova pro žebříček.")
        else:
            top_keywords = keywords.head(15)
            fig_keywords = px.bar(
                top_keywords,
                x="count",
                y="keyword",
                orientation="h",
                template="plotly_white",
                color="count",
                color_continuous_scale="Emrld",
            )
            fig_keywords.update_layout(
                height=420,
                margin={"l": 10, "r": 10, "t": 10, "b": 10},
                coloraxis_showscale=False,
                xaxis_title="Frekvence",
                yaxis_title="Klíčové slovo",
                yaxis={"categoryorder": "total ascending"},
            )
            st.plotly_chart(fig_keywords, use_container_width=True)
    st.markdown("</div>", unsafe_allow_html=True)


def render_fun_section(data: pd.DataFrame) -> None:
    st.markdown('<div class="panel-card">', unsafe_allow_html=True)
    st.subheader("Doplňková sekce: vtipné sloupce")
    col1, col2 = st.columns(2)

    with col1:
        valid_shoe_sizes = data[data[SHOE_COL].between(30, 55, inclusive="both")].copy()
        if valid_shoe_sizes.empty:
            st.info("Po filtraci nejsou dostupná validní data pro číslo obuvi.")
        else:
            fig_shoes = px.histogram(
                valid_shoe_sizes,
                x=SHOE_COL,
                nbins=15,
                template="plotly_white",
                color_discrete_sequence=["#005b96"],
            )
            fig_shoes.update_layout(
                height=320,
                margin={"l": 10, "r": 10, "t": 10, "b": 10},
                xaxis_title="Číslo obuvi",
                yaxis_title="Počet návštěvníků",
            )
            st.plotly_chart(fig_shoes, use_container_width=True)

    with col2:
        pet_counts = data["pet_group"].value_counts().reset_index()
        pet_counts.columns = ["Preference", "Počet"]
        fig_pets = px.pie(
            pet_counts,
            names="Preference",
            values="Počet",
            hole=0.38,
            template="plotly_white",
            color_discrete_sequence=px.colors.qualitative.Pastel,
        )
        fig_pets.update_layout(height=320, margin={"l": 10, "r": 10, "t": 10, "b": 10})
        st.plotly_chart(fig_pets, use_container_width=True)
    st.markdown("</div>", unsafe_allow_html=True)


def render_data_preview(data: pd.DataFrame, mode: str) -> None:
    with st.expander("Zobrazit filtrovaná data"):
        relevant_columns = [
            VISITOR_COL,
            GENDER_COL,
            CITY_COL,
            SCHOOL_COL,
            SOURCE_COL,
            PROGRAM_COL,
            SUBJECT_COL,
            IMPORTANT_COL,
            TIME_COL,
        ]
        fun_columns = [VISITOR_COL, SHOE_COL, PET_COL, TIME_COL]

        if mode == "Relevantní sloupce":
            preview_columns = relevant_columns
        elif mode == "Vtipné sloupce":
            preview_columns = fun_columns
        else:
            preview_columns = list(dict.fromkeys(relevant_columns + fun_columns))

        st.dataframe(data[preview_columns], use_container_width=True, hide_index=True)


def render_footer_note() -> None:
    st.markdown(
        '<p class="note"><b>Poznámka:</b> Všechny grafy jsou propojené přes společné filtry v levém panelu.</p>',
        unsafe_allow_html=True,
    )
