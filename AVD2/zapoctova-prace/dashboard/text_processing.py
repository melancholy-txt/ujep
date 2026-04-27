from collections import Counter
import re

import pandas as pd

from .constants import PROGRAM_TEACHING, PROGRAM_TEACHING_RAW, STOPWORDS_CZ

KEYWORD_ALIASES = {
    "obor": "obor",
    "oboru": "obor",
    "oborem": "obor",
    "oborech": "obor",
    "obory": "obor",
    "oborů": "obor",
    "oborům": "obor",
    "možnost": "možnost",
    "možnosti": "možnost",
    "možností": "možnost",
    "možnostem": "možnost",
    "možnostmi": "možnost",
}

KEYWORD_STOPWORDS = STOPWORDS_CZ | {
    "abych",
    "abys",
    "abychom",
    "abyste",
    "studia",
    "studiu",
    "studiem",
    "studii",
    "výuka",
    "výuku",
    "výuky",
    "výuce",
    "výukou",
    "vyuka",
    "vyuku",
    "vyuky",
    "vyuce",
    "vyukou",
}


def clean_spaces(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def split_programs(value: object) -> list[str]:
    if pd.isna(value):
        return []

    text = str(value).replace("\n", " ")
    text = text.replace('""', '"').strip().strip('"')
    text = clean_spaces(text)
    if not text:
        return []

    text = text.replace(f'"{PROGRAM_TEACHING_RAW}"', PROGRAM_TEACHING_RAW)
    text = text.replace(PROGRAM_TEACHING_RAW, "__TEACHING__")

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
    words = []
    for token in tokens:
        if len(token) < 3 or token.isdigit():
            continue

        token = KEYWORD_ALIASES.get(token, token)
        if token in KEYWORD_STOPWORDS:
            continue

        words.append(token)

    counts = Counter(words)
    if not counts:
        return pd.DataFrame(columns=["keyword", "count"])

    return pd.DataFrame(counts.most_common(limit), columns=["keyword", "count"])
