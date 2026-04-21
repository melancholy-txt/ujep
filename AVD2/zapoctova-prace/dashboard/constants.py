from pathlib import Path

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

ROOT_DIR = Path(__file__).resolve().parent.parent
DATA_PATH = ROOT_DIR / "data" / "DOD_2026_data.csv"
LOGO_PATH = ROOT_DIR / "image" / "PRF" / "LOGO_PRF_CZ_RGB_standard.jpg"
FAVICON_PATH = ROOT_DIR / "image" / "PRF" / "PRF-favicon.png"

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
