import re

def process_markdown(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        text = f.read()

    # 1. Remove empty ``` blocks capturing text.
    # Replace ```\n ... \n``` with just the text.
    text = re.sub(r'```\n*(.*?)\n*```', r'\1', text, flags=re.DOTALL)

    # 2. Fix typical Czech typos from OCR/PDF extraction
    replacements = {
        'vÚstí': 'v Ústí',
        'jedním rovnicí': 'jednou rovnicí',
        'nevýsledkuje v': 'nevede k',
        'Casto': 'Často',
        '5.Žádná': '5. Žádná',
        'přílišúzce': 'příliš úzce',
        'β 0': '\\beta_0',
        'β 1': '\\beta_1',
        'β 2': '\\beta_2',
        'βn': '\\beta_n',
        'X 1': 'X_1',
        'X 2': 'X_2',
        'Xn': 'X_n',
        'Xp': 'X_p',
        'ρY.X': '\\rho_{Y.X}',
        'Y.X': 'Y.X'
    }
    for old, new in replacements.items():
        text = text.replace(old, new)

    # Line breaking fixing:
    
    # Hyphenated words break at end of line (e.g. slovo- \ndruha_cast -> slovodruha_cast)
    cz_chars = 'a-zA-ZáčďéěíňóřšťúůýžÁČĎÉĚÍŇÓŘŠŤÚŮÝŽ'
    text = re.sub(fr'([{cz_chars}])- *\n([{cz_chars}])', r'\1\2', text)
    
    # Broken newlines without hyphen: if line ends with char/comma, and next starts with char.
    text = re.sub(fr'([{cz_chars},])\n([{cz_chars}])', r'\1 \2', text)
    text = re.sub(r' {2,}', ' ', text)

    # Format multi-line equations correctly
    # Finding lines matching typical equation things
    text = re.sub(r'(?m)^Y = \\beta_0 \+ \\beta_1 X_1.*$', lambda m: f'$$\n{m.group(0)}\n$$', text)
    text = re.sub(r'(?m)^\\rho_\{Y.X\} = max.*$', lambda m: f'$$\n{m.group(0)}\n$$', text)
    text = re.sub(r'(?m)^\\rho_\{Y.X\} *\\in.*$', lambda m: f'$$\n{m.group(0)}\n$$', text)
    text = re.sub(r'(?m)^\\rho_\{Y.X\} *= *[01].*$', lambda m: f'$$\n{m.group(0)}\n$$', text)
    text = re.sub(r'(?m)^a̸=.*$', lambda m: f'  a \\neq 0 ', text)
    
    # Math lines often have equations on multiple lines, we can try to merge them or just wrap them.
    # We do a basic fix.
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(text)

process_markdown(r'c:\Users\tovis\Documents\GitHub\ujep\PSM\b2\Regression_2.md')
print("Done processing!")
