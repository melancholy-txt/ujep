import pandas as pd
import streamlit as st

from .constants import (
    CITY_COL,
    DATA_PATH,
    GENDER_COL,
    IMPORTANT_COL,
    PET_COL,
    PROGRAM_COL,
    PROGRAM_TEACHING,
    SCHOOL_COL,
    SHOE_COL,
    SOURCE_COL,
    SUBJECT_COL,
    TIME_COL,
    VISITOR_COL,
)
from .text_processing import clean_spaces, split_programs, split_simple_list


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
    # return mapping.get(text, text)
    return text


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


@st.cache_data
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
