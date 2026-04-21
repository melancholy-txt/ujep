import streamlit as st


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
