from __future__ import annotations

from collections import Counter
from pathlib import Path
import re

import numpy as np
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import streamlit as st

VISITOR_COL = "Návštěvník"
GENDER_COL = "Pohlaví"
CITY_COL = "Místo bydliště"
SCHOOL_COL = "Škola"
SOURCE_COL = "Zdroj informace o DOD"
PROGRAM_COL = "Který obor mne zajímá"
SUBJECT_COL = "Učitelství - předmět"
IMPORTANT_COL = "Co je důležité při výběru školy"
SHOE_COL = "Číslo obuvi"
PET_COL = "Kočka nebo pes?"
TIME_COL = "Čas hlasování"

PROGRAM_TEACHING = "Učitelství (obory pro vzdělávání, učitelství pro SŠ)"

ROOT_DIR = Path(__file__).resolve().parent
DATA_PATH = ROOT_DIR / "data" / "DOD_2026_data.csv"
LOGO_PATH = ROOT_DIR / "image" / "PRF" / "LOGO_PRF_CZ_RGB_standard.jpg"

STOPWORDS_CZ = {
    "aby",
    "asi",
    "bez",
    "bude",
    "budu",
    "by",
    "co",
    "dané",
    "díky",
    "do",
    "dobra",
    "dobré",
    "dobry",
    "ho",
    "i",
    "jak",
    "je",
    "její",
    "jejich",
    "jen",
    "jsem",
    "jsou",
    "k",
    "kde",
    "kdy",
    "ktera",
    "která",
    "které",
    "který",
    "mi",
    "mě",
    "mne",
    "na",
    "nad",
    "nebo",
    "od",
    "po",
    "pod",
    "pro",
    "proto",
    "při",
    "se",
    "si",
    "s",
    "tak",
    "také",
    "tam",
    "ta",
    "to",
    "u",
    "ve",
    "v",
    "z",
    "za",
    "ze",
    "že",
}


def inject_styles() -> None:
    st.markdown(
        """
        <style>
            :root {
                --brand-main: #005b96;
                --brand-accent: #00897b;
                --brand-highlight: #f4a259;
                --surface: rgba(255, 255, 255, 0.86);
            }

            html, body, [data-testid="stAppViewContainer"] {
                font-family: "Helvetica CE", Helvetica, Arial, sans-serif;
                color: #102a43;
                background:
                    radial-gradient(circle at 10% 20%, rgba(0, 137, 123, 0.20), transparent 28%),
                    radial-gradient(circle at 85% 0%, rgba(0, 91, 150, 0.24), transparent 25%),
                    linear-gradient(145deg, #f8fcff 0%, #ecf6ff 55%, #f5fbf9 100%);
            }

            [data-testid="stHeader"] {
                background: rgba(0, 0, 0, 0);
            }

            .main .block-container {
                max-width: 1450px;
                padding-top: 1.2rem;
                padding-bottom: 2rem;
            }

            .dashboard-title {
                font-size: clamp(2rem, 3.5vw, 3rem);
                font-weight: 800;
                line-height: 1.1;
                letter-spacing: 0.02em;
                color: var(--brand-main);
                margin-bottom: 0.35rem;
            }

            .dashboard-subtitle {
                font-size: 1.03rem;
                color: #3f5873;
                margin-bottom: 1rem;
            }

            .panel-card {
                background: var(--surface);
                border-radius: 16px;
                border: 1px solid rgba(0, 91, 150, 0.12);
                box-shadow: 0 7px 24px rgba(17, 68, 92, 0.08);
                padding: 0.8rem 1rem 0.4rem 1rem;
                margin-bottom: 0.8rem;
            }

            [data-testid="stMetric"] {
                background: rgba(255, 255, 255, 0.72);
                border-radius: 12px;
                border: 1px solid rgba(0, 91, 150, 0.14);
                padding: 0.25rem 0.4rem;
            }

            .note {
                color: #3f5873;
                font-size: 0.95rem;
            }
        </style>
        """,
        unsafe_allow_html=True,
    )


def clean_spaces(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def normalize_school(value: object) -> str:
    if pd.isna(value):
        return "Neuvedeno"
    text = clean_spaces(str(value))
    if text == "Nestuduji na žádné škole":
        return "Nestuduji"
    return text


def normalize_source(value: object) -> str:
    if pd.isna(value):
        return "Neuvedeno"
    text = clean_spaces(str(value))
    mapping = {
        "Instagram/Facebook": "Sociální sítě",
        "Web univerzity/fakulty": "Web",
        "Plakát/Leták/Billboard": "Plakát/leták",
        "Doporučil mi učitel": "Doporučení",
        "Doporučil mi kamarád": "Doporučení",
        "Jinde": "Jinde",
    }
    return mapping.get(text, text)


def normalize_pet(value: object) -> str:
    if pd.isna(value):
        return "Neuvedeno"
    text = str(value).lower()
    if "pes" in text:
        return "Pes"
    if "kočka" in text or "kocka" in text:
        return "Kočka"
    if "alergik" in text:
        return "Alergik"
    return "Jiné"


def split_programs(value: object) -> list[str]:
    if pd.isna(value):
        return []

    text = str(value).replace("\n", " ")
    text = text.replace('""', '"').strip().strip('"')
    text = clean_spaces(text)
    if not text:
        return []

    text = text.replace(f'"{PROGRAM_TEACHING}"', PROGRAM_TEACHING)
    text = text.replace(PROGRAM_TEACHING, "__TEACHING__")

    programs = []
    for raw_part in text.split(","):
        part = raw_part.strip().strip('"')
        part = part.replace("__TEACHING__", PROGRAM_TEACHING)
        part = clean_spaces(part)
        if part:
            programs.append(part)
    return programs


def split_simple_list(value: object) -> list[str]:
    if pd.isna(value):
        return []
    text = clean_spaces(str(value).replace("\n", " "))
    if not text:
        return []

    values = []
    for item in text.split(","):
        token = clean_spaces(item)
        if token:
            values.append(token)
    return values


def extract_keywords(text_series: pd.Series, limit: int = 35) -> pd.DataFrame:
    raw_text = " ".join(text_series.fillna("").astype(str).tolist()).lower()
    raw_text = raw_text.replace("\n", " ")
    raw_text = re.sub(r"[^\w\s]", " ", raw_text, flags=re.UNICODE)
    raw_text = re.sub(r"[\d_]", " ", raw_text)

    tokens = [clean_spaces(token) for token in raw_text.split(" ")]
    words = [
        token
        for token in tokens
        if len(token) >= 3 and token not in STOPWORDS_CZ and not token.isdigit()
    ]

    counts = Counter(words)
    if not counts:
        return pd.DataFrame(columns=["keyword", "count"])

    return pd.DataFrame(counts.most_common(limit), columns=["keyword", "count"])


def build_wordcloud_figure(keyword_df: pd.DataFrame) -> go.Figure:
    fig = go.Figure()
    if keyword_df.empty:
        fig.add_annotation(
            text="Po použití filtrů nejsou k dispozici slova pro word cloud.",
            x=0.5,
            y=0.5,
            showarrow=False,
            font={"size": 16, "color": "#3f5873"},
        )
        fig.update_xaxes(visible=False, range=[0, 1])
        fig.update_yaxes(visible=False, range=[0, 1])
        fig.update_layout(height=420, margin={"l": 0, "r": 0, "t": 0, "b": 0})
        return fig

    top_words = keyword_df.head(32).copy()
    top_words = top_words.sort_values("count", ascending=False).reset_index(drop=True)

    count_min = float(top_words["count"].min())
    count_max = float(top_words["count"].max())
    if count_min == count_max:
        sizes = np.full(len(top_words), 34.0)
    else:
        sizes = np.interp(top_words["count"], (count_min, count_max), (18, 54))

    angles = np.linspace(0, 8 * np.pi, len(top_words), endpoint=False)
    radii = np.linspace(0.03, 0.44, len(top_words))
    x_coords = 0.5 + radii * np.cos(angles)
    y_coords = 0.5 + radii * np.sin(angles)

    palette = ["#005b96", "#00897b", "#f4a259", "#3f5873", "#0e6b5a"]
    for idx, row in top_words.iterrows():
        fig.add_annotation(
            x=float(x_coords[idx]),
            y=float(y_coords[idx]),
            text=row["keyword"],
            showarrow=False,
            font={"size": float(sizes[idx]), "color": palette[idx % len(palette)]},
            opacity=0.9,
        )

    fig.update_xaxes(visible=False, range=[0, 1])
    fig.update_yaxes(visible=False, range=[0, 1])
    fig.update_layout(
        height=420,
        margin={"l": 0, "r": 0, "t": 0, "b": 0},
        paper_bgcolor="rgba(0,0,0,0)",
        plot_bgcolor="rgba(0,0,0,0)",
    )
    return fig


def load_data() -> pd.DataFrame:
    data = pd.read_csv(DATA_PATH)

    required_columns = {
        VISITOR_COL,
        GENDER_COL,
        CITY_COL,
        SCHOOL_COL,
        SOURCE_COL,
        PROGRAM_COL,
        SUBJECT_COL,
        IMPORTANT_COL,
        SHOE_COL,
        PET_COL,
        TIME_COL,
    }
    missing = required_columns.difference(data.columns)
    if missing:
        missing_text = ", ".join(sorted(missing))
        raise ValueError(f"V datech chybí sloupce: {missing_text}")

    data = data.copy()
    data[TIME_COL] = pd.to_datetime(data[TIME_COL], format="%d.%m.%Y %H:%M", errors="coerce")
    data = data[data[TIME_COL].notna()].copy()

    data[GENDER_COL] = data[GENDER_COL].fillna("Neuvedeno").apply(lambda value: clean_spaces(str(value)))
    data[CITY_COL] = data[CITY_COL].fillna("Neuvedeno").apply(lambda value: clean_spaces(str(value)))
    data[SCHOOL_COL] = data[SCHOOL_COL].apply(normalize_school)
    data["source_group"] = data[SOURCE_COL].apply(normalize_source)
    data["pet_group"] = data[PET_COL].apply(normalize_pet)

    data["program_list"] = data[PROGRAM_COL].apply(split_programs)
    data["subject_list"] = data[SUBJECT_COL].apply(split_simple_list)
    data["has_teaching_interest"] = data["program_list"].apply(lambda values: PROGRAM_TEACHING in values)

    data["time_slot"] = data[TIME_COL].dt.floor("15min")
    data["hour_label"] = data[TIME_COL].dt.strftime("%H:00")

    data[SHOE_COL] = pd.to_numeric(data[SHOE_COL], errors="coerce")
    data[IMPORTANT_COL] = data[IMPORTANT_COL].fillna("").astype(str)
    return data


def build_program_table(data: pd.DataFrame) -> pd.DataFrame:
    program_table = data[
        [
            VISITOR_COL,
            GENDER_COL,
            CITY_COL,
            SCHOOL_COL,
            "source_group",
            TIME_COL,
            "program_list",
            "has_teaching_interest",
        ]
    ].explode("program_list")

    program_table = program_table.rename(columns={"program_list": "Obor"})
    program_table = program_table[program_table["Obor"].notna()]
    program_table["Obor"] = program_table["Obor"].apply(clean_spaces)
    program_table = program_table[program_table["Obor"] != ""]
    return program_table


def build_subject_table(data: pd.DataFrame) -> pd.DataFrame:
    subject_table = data[data["has_teaching_interest"]].copy()
    subject_table = subject_table[[VISITOR_COL, SCHOOL_COL, GENDER_COL, CITY_COL, "source_group", "subject_list"]]
    subject_table = subject_table.explode("subject_list")
    subject_table = subject_table.rename(columns={"subject_list": "Předmět"})
    subject_table = subject_table[subject_table["Předmět"].notna()]
    subject_table["Předmět"] = subject_table["Předmět"].apply(clean_spaces)
    subject_table = subject_table[subject_table["Předmět"] != ""]
    return subject_table


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

    min_time = data[TIME_COL].min().to_pydatetime()
    max_time = data[TIME_COL].max().to_pydatetime()
    time_range = st.sidebar.slider(
        "Čas návštěvy",
        min_value=min_time,
        max_value=max_time,
        value=(min_time, max_time),
        format="HH:mm",
    )

    genders = sorted(data[GENDER_COL].dropna().unique().tolist())
    cities = sorted(data[CITY_COL].dropna().unique().tolist())
    schools = sorted(data[SCHOOL_COL].dropna().unique().tolist())
    sources = sorted(data["source_group"].dropna().unique().tolist())
    programs = sorted(program_table["Obor"].dropna().unique().tolist())
    subjects = sorted(subject_table["Předmět"].dropna().unique().tolist())

    filters = {
        "mode": mode,
        "time_range": time_range,
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
    start_time, end_time = filters["time_range"]
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


def main() -> None:
    st.set_page_config(
        page_title="Dashboard DOD PřF UJEP",
        page_icon="image/PRF/PRF-favicon.png",
        layout="wide",
        initial_sidebar_state="expanded",
    )
    inject_styles()
    render_header()

    data = load_data()
    program_table = build_program_table(data)
    subject_table = build_subject_table(data)

    filters = build_sidebar_filters(data, program_table, subject_table)
    filtered_data, filtered_programs, filtered_subjects = apply_filters(
        data,
        program_table,
        subject_table,
        filters,
    )

    render_kpis(filtered_data, filtered_programs)

    mode = filters["mode"]
    if mode in {"Relevantní sloupce", "Obojí"}:
        render_relevant_section(filtered_data, filtered_programs, filtered_subjects)

    if mode in {"Vtipné sloupce", "Obojí"}:
        render_fun_section(filtered_data)

    st.markdown(
        '<p class="note"><b>Poznámka:</b> Všechny grafy jsou propojené přes společné filtry v levém panelu.</p>',
        unsafe_allow_html=True,
    )
    render_data_preview(filtered_data, mode)


if __name__ == "__main__":
    main()