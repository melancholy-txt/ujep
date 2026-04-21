import streamlit as st

from .constants import FAVICON_PATH
from .data import build_program_table, build_subject_table, load_data
from .filters import apply_filters, build_sidebar_filters
from .sections import (
    render_data_preview,
    render_footer_note,
    render_fun_section,
    render_header,
    render_kpis,
    render_relevant_section,
)
from .styles import inject_styles


def run_dashboard() -> None:
    page_icon = str(FAVICON_PATH) if FAVICON_PATH.exists() else "📊"
    st.set_page_config(
        page_title="Dashboard DOD PřF UJEP",
        page_icon=page_icon,
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

    render_footer_note()
    render_data_preview(filtered_data, mode)
