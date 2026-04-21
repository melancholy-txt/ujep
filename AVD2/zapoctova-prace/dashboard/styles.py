import streamlit as st

from .constants import PRF_GREY, PRF_PRIMARY, PRF_SECONDARY, PRF_TEXT


def inject_styles() -> None:
    # Keep a stable light rendering because static custom CSS is tuned for light surfaces.
    st.markdown(
        f"""
        <style>
            :root {
                --brand-primary: {PRF_PRIMARY};
                --brand-secondary: {PRF_SECONDARY};
                --brand-text: {PRF_TEXT};
                --brand-grey: {PRF_GREY};
                --surface: #ffffff;
            }

            html, body, [data-testid="stAppViewContainer"] {
                color-scheme: light !important;
                font-family: "Helvetica CE", Helvetica, Arial, sans-serif;
                color: var(--brand-text);
                background:
                    radial-gradient(circle at 90% -5%, rgba(111, 189, 199, 0.28), transparent 26%),
                    linear-gradient(160deg, #ffffff 0%, #f6fafb 48%, #f2f6f7 100%);
            }

            [data-testid="stHeader"] {
                background: rgba(0, 0, 0, 0);
            }

            [data-testid="stSidebar"] {
                background: #f7fbfc;
                border-right: 1px solid rgba(28, 21, 41, 0.10);
            }

            [data-testid="stSidebar"] * {
                color: var(--brand-text);
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
                color: var(--brand-secondary);
                margin-bottom: 0.35rem;
            }

            .dashboard-subtitle {
                font-size: 1.03rem;
                color: rgba(28, 21, 41, 0.78);
                margin-bottom: 1rem;
            }

            .panel-card {
                background: var(--surface);
                border-radius: 8px;
                border: 1px solid rgba(28, 21, 41, 0.10);
                box-shadow: 0 3px 12px rgba(28, 21, 41, 0.06);
                padding: 0.8rem 1rem 0.4rem 1rem;
                margin-bottom: 0.8rem;
            }

            [data-testid="stMetric"] {
                background: #ffffff;
                border-radius: 8px;
                border: 1px solid rgba(28, 21, 41, 0.10);
                padding: 0.25rem 0.4rem;
            }

            [data-baseweb="select"] > div,
            [data-baseweb="input"] > div,
            [data-baseweb="textarea"] > div {
                border-radius: 8px !important;
                border-color: rgba(28, 21, 41, 0.18) !important;
            }

            [data-baseweb="tag"] {
                border-radius: 6px !important;
                border: 1px solid rgba(1, 114, 128, 0.32) !important;
                background: rgba(111, 189, 199, 0.22) !important;
            }

            [data-baseweb="tag"] span {
                color: var(--brand-text) !important;
            }

            hr {
                border: 0;
                border-top: 1px solid rgba(28, 21, 41, 0.14);
            }

            .stTabs [role="tab"] {
                border-radius: 6px;
            }

            .note {
                color: rgba(28, 21, 41, 0.78);
                font-size: 0.95rem;
            }

            a {
                color: var(--brand-secondary);
            }
        </style>
        """,
        unsafe_allow_html=True,
    )
