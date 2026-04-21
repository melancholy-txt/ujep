# Dashboard DOD PřF UJEP

Interaktivní dashboard pro analýzu dat ze Dne otevřených dveří na Přírodovědecké fakultě UJEP.

## Co dashboard obsahuje

- jednostránkové desktopové rozložení (wide layout),
- branding: název dashboardu, autor Antonín Višňák, logo PřF UJEP,
- font stack s preferencí Helvetica CE,
- sdílené filtry napříč všemi grafy (globální průřez),
- režim zobrazení: relevantní sloupce, vtipné sloupce, obojí,
- minimálně 4 různé typy vizualizací.

## Přehled sekcí

- návštěvnost v čase,
- struktura návštěvníků podle pohlaví, místa bydliště a školy,
- zdroje, odkud se návštěvníci dozvěděli o DOD,
- zájem o obory a heatmapa škola × obor,
- nejčastější předměty u učitelství,
- highlights otázky Co je důležité při výběru školy (word cloud + top klíčová slova),
- doplňková sekce pro vtipné sloupce (číslo obuvi, kočka/pes).

## Spuštění

1. Získejte `uv` package manager pro Python.
2. Spusťte Streamlit aplikaci:

```powershell
uv run streamlit run app.py
```

Data se načítají z souboru `data/DOD_2026_data.csv`.
