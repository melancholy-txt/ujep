import numpy as np
import pandas as pd
import plotly.graph_objects as go


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

    top_words = keyword_df.head(22).copy()
    top_words = top_words.sort_values("count", ascending=False).reset_index(drop=True)

    count_min = float(top_words["count"].min())
    count_max = float(top_words["count"].max())
    if count_min == count_max:
        sizes = np.full(len(top_words), 30.0)
    else:
        sizes = np.interp(top_words["count"], (count_min, count_max), (16, 42))

    angles = np.linspace(0, 8 * np.pi, len(top_words), endpoint=False)
    radii = np.linspace(0.08, 0.47, len(top_words))
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
