---
marp: true
theme: default
paginate: true
header: "PEM: Ekonomické výpočty"
size: 16:9
---

# Různé druhy daní a jejich výpočet
## (DPH, čistá mzda, DPFO/DPPO, optimalizace)

**Pro rok:** 2026

---

# Přehled daňového systému v ČR

Pro informatiky jsou klíčové dvě hlavní skupiny daní:

1.  **Daně přímé** (odvádí poplatník ze svých příjmů)
    - Daně z příjmů (DPFO - fyzické osoby, DPPO - právnické osoby)
    - Daň z nemovitých věcí, Silniční daň (pro podnikatele)
2.  **Daně nepřímé** (vybírány v cenách zboží a služeb)
    - **DPH** (Daň z přidané hodnoty)
    - Spotřební daně (líh, tabák, paliva)

**Důležité:** Od roku 2026 došlo k zásadní reformě! Registrační práh se snížil z 2 mil. Kč na **1,75 mil. Kč**.

---

# DPH (Daň z přidané hodnoty)

Nejdůležitější daň pro podnikání v IT (nákup HW, prodej služeb/licencí).

- **Princip:** Podnikatel odvede státu rozdíl mezi DPH, kterou vybral od zákazníků (výstup), a DPH, kterou zaplatil dodavatelům (vstup).

### Sazby
*   **Základní 21%:** Většina zboží, IT služby, software, konzultace.
*   **Snížená 15%:** Potraviny, knihy, ubytování *(změna z 12%)*
*   **Super-snížená 10%:** Vybrané zdravotnické služby, zdravotnické pomůcky.

### Kdy se musíte registrovat?

Povinně, pokud obrat překročí **1 750 000 Kč** za 12 po sobě jdoucích měsíců.

---

# Výpočet DPH - Příklad 

Jste IT freelancer (plátce DPH) a fakturujete vytvoření webu.

1.  **Vaše cena (Základ daně):** 50 000 Kč
2.  **DPH (21%):** $50\,000 \times 0,21 = 10\,500 \text{ Kč}$
3.  **Celkem k úhradě:** 60 500 Kč

**Zároveň** si koupíte nový notebook za 30 000 Kč (+ 6 300 Kč DPH).

**Odvod státu:**
$$ \text{Vystupni DPH} (10\,500) - \text{Vstupni DPH narok} (6\,300) = \mathbf{4\,200 \text{ Kč}} $$

**Pozn.:** Pokud jste registrován, vrátíte si DPH za nákupy. Bez registrace byste DPH strávil jako finální náklad.

---

# Zdanění práce: Zaměstnanec (DPFO 2026)

Jak se počítá **Čistá mzda** z Hrubé mzdy?

**Vzorec:**
$$ \text{Hruba mzda} - \text{Socialni} - \text{Zdravotni} - \text{Dan (po slevach)} = \text{Cista mzda} $$

*   **Sociální pojištění (zaměstnanec):** 9,2% z hrubé mzdy
*   **Zdravotní pojištění (zaměstnanec):** 4,5% z hrubé mzdy
*   **Daň z příjmu FO:** 15% (nebo 23% pro příjmy nad cca 3× průměrnou mzdu)
*   **Mzdové náklady zaměstnavatele:** Hrubá mzda × 1,335 (celkem +33,5% na odvodech)

---

# Příklad: Výpočet čisté mzdy (2026)

**Hrubá mzda:** 50 000 Kč

1.  **Pojištění (strhává se zaměstnanci):**
    - Soc: $50\,000 \times 0,092 = 4\,600 \text{ Kč}$
    - Zdr: $50\,000 \times 0,045 = 2\,250 \text{ Kč}$
2.  **Výpočet Daně (záloha):**
    - Hrubá daň: $50\,000 \times 0,15 = 7\,500 \text{ Kč}$
    - Sleva na poplatníka (základní): cca 2 600 Kč
    - Daň po slevě: $7\,500 - 2\,600 = 4\,900 \text{ Kč}$
3.  **Čistá mzda:**
    $50\,000 - 4\,600 - 2\,250 - 4\,900 = \mathbf{38\,250 \text{ Kč}}$


---

# Zdanění podnikání: OSVČ (Freelancer)
IT specialista (OSVČ) má 3 hlavní režimy zdanění:

1.  **Reálné výdaje:** Vede daňovou evidenci (příjmy minus výdaje). Pro IT málo výhodné.
2.  **Paušální výdaje (nejpopulárnější):**
    *   Pro IT lze uplatnit **60%** příjmů jako fiktivní výdaj.
    *   Daní se jen zbylých 40% zisku.
    *   Super-jednoduché!
3.  **Paušální daň (Flat Tax) - nový režim:**
    *   Jedna platba měsíčně zahrnuje daň, zdrav. i soc. pojištění.
    *   **0 Kč pro příjmy do 400 000 Kč ročně** (nová hranice!)
    *   Pak postupně: 5 472 Kč → 32 832 Kč (podle příjmů).

---

# OSVČ: Paušální výdaje - Příklad

**Příjem z IT projektu:** 100 000 Kč

### Režim A: Paušální výdaje (60%)
- Příjmy: 100 000 Kč
- Výdaje (paušál 60%): −60 000 Kč
- **Základ daně:** 40 000 Kč
- Daň (15%): 6 000 Kč
- **Sociální pojištění (min):** ~3 428 Kč/měsíc
- **Zdravotní pojištění (min):** ~2 393 Kč/měsíc

---

# OSVČ: Paušální výdaje - Příklad

**Příjem z IT projektu:** 100 000 Kč

### Režim B: Paušální daň
- Měsíční platba (příjem 100k/měsíc = 1,2 mil./rok): cca **11 000 Kč** (vše zahrnuto!)
- Veškerá administrativa zautomatizovaná
- Žádné vedení účetnictví

**Pro 100k/měsíc:** Paušální daň (11k vs. 6k daň + pojištění)! (o asi ~700 Kč lol)

---

# DPPO: Daň z příjmů právnických osob (s.r.o.)

Pokud založíte **s.r.o.** (startup, softwarová firma):

*   Předmětem daně je zisk společnosti (Výnosy − Náklady).
*   **Sazba daně:** **19%** (od 2024; nezměnilo se)

---

# DPPO: Daň z příjmů právnických osob (s.r.o.)

### Výhody s.r.o.:

- Omezené ručení (limitované riziko)
- Možnost opakovaného využití firmy (na rozdíl od OSVČ, která je vázána na fyzickou osobu)
- Prestiž, lepší podmínky u bank

### Nevýhody:

- **Dvojí zdanění:** Zisky jsou zdaněny na úrovni s.r.o. (19%), pak když si je vyplatíte jako majitel, zdaní se znovu (15% srážková daň na podíly)
- Povinná účetnictví (dražší administrativu)
- Registr rejstříku, notář (~5 000 Kč na začátku)

---

# Daňová optimalizace: Legální strategie

### 1. Výběr správného právního režimu
| Příjem/rok | Nejlepší volba | Čistý zisk (%) |
| :--- | :--- | :--- |
| **0–400 k Kč** | Paušální daň OSVČ | 100% (0 Kč daň!) |
| **400k–1,75 mil** | OSVČ (paušál 60%) | ~75–80% |
| **>1,75 mil** | OSVČ nebo s.r.o. | závisí na struktuře |

### 2. Timing DPH registrace

- **Před 1,75 mil. Kč:** Není DPH povinný → nákupy jsou finální náklad
- **Po 1,75 mil. Kč:** Povinný DPH → vrátí si DPH za nákupy

**Dobrá praxe:** Sledovat obrat před dosažením prahu a včas se zaregistrovat!

---
# Daňová optimalizace: Naše strategie

**Dobrá praxe:** Daňové úniky

---

# Praktické příklady: Employee vs OSVČ vs s.r.o.

### Scénář: Nový IT specialista s příjmem 60k Kč/měsíc = 720k Kč/rok

| Aspekt              | **Zaměstnanec**    | **OSVČ (60% paušál)** | **s.r.o.**        |
| :------------------ | :----------------- | :-------------------- | :---------------- |
| **Hrubý příjem**    | 60 000             | 60 000                | 60 000            |
| **Daň + pojištění** | ~15 000            | ~5 500                | ~11 400 (daň 19%) |
| **Čistý příjem**    | ~45 000            | ~54 500               | ~48 600           |
| **Administrativa**  | Nula               | Minimální             | Výrazná           |
| **Riziko**          | Zaměstnavatel nese | Já neru               | Omezené           |
| **Flexibilita**     | Nula               | Vysoká                | Střední           |

**Vítěz pro tuto výši příjmu:** OSVČ s paušálními výdaji (54 500 Kč čistého)!

---

# Daňový kalendář pro rok 2026

| Termín           | Co dělat?                                      |
| :--------------- | :--------------------------------------------- |
| **Každý měsíc**  | Zaplatit sociální a zdravotní pojištění (OSVČ) |
| **Každý měsíc**  | Nákup HW/služeb s DPH (pokud jsi plátce)      |
| **Konec února**  | Podání daňového přiznání za předchozí rok      |
| **Konec března** | Úhrada zbytku daně (pokud je splatná)          |
| **Průběžně**     | Kontrolovat obrat (je-li pod/nad 1,75 mil. Kč) |
| **Prosinec**     | Plánovat optimalizaci na příští rok            |



---

# Shrnutí: Klíčová čísla pro praxi (2026)

| Metrika | Hodnota |
| :--- | :--- |
| **DPH - Standardní sazba** | 21% od **1 750 000 Kč**|
| **DPFO (zaměstnanec)** | 15% |
| **DPPO (s.r.o.)** | 19% |
| **OSVČ - Paušální výdaje (IT)** | 60% |
| **OSVČ - Paušální daň (do 400k)** | **0 Kč**|
| **Sociální pojištění zaměstnance** | 9,2% |
| **Zdravotní pojištění zaměstnance** | 4,5% |
| **Minimální měsíční pojištění OSVČ** | ~5 821 Kč |

---

# Děkujeme za pozornost!

*Zdroje: Finanční správa ČR (FS.cz), Zákon o daních z příjmů 2026, Zákon o DPH 2026, antirecyklační opatření EU*


