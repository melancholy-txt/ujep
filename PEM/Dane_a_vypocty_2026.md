---
marp: true
theme: default
paginate: true
header: "PEM: Ekonomické výpočty"
footer: "Téma 3: Daně a jejich výpočet (2026)"
size: 16:9
---

# 3. Různé druhy daní a jejich výpočet
## (DPH, čistá mzda, DPFO/DPPO, optimalizace)

**Předmět:** Právo a ekonomika pro informatiky
**Rok:** 2026
**Cíl:** Pochopit daňový systém z pohledu zaměstnance i podnikatele (OSVČ/s.r.o.) a legální optimalizaci daňové zátěže

---

# Přehled daňového systému v ČR (2026)

Pro informatiky jsou klíčové dvě hlavní skupiny daní:

1.  **Daně přímé** (odvádí poplatník ze svých příjmů)
    *   Daně z příjmů (DPFO - fyzické osoby, DPPO - právnické osoby)
    *   Daň z nemovitých věcí, Silniční daň (pro podnikatele)
    
2.  **Daně nepřímé** (vybírány v cenách zboží a služeb)
    *   **DPH** (Daň z přidané hodnoty)
    *   Spotřební daně (líh, tabák, paliva)

**Důležité:** Od roku 2026 došlo k zásadní reformě! Registrační práh se snížil z 2 mil. Kč na **1,75 mil. Kč**.

---

# DPH (Daň z přidané hodnoty) — 2026

Nejdůležitější daň pro podnikání v IT (nákup HW, prodej služeb/licencí).

*   **Princip:** Podnikatel odvede státu rozdíl mezi DPH, kterou vybral od zákazníků (výstup), a DPH, kterou zaplatil dodavatelům (vstup).

### Sazby (2026) — ZMĚNA!
*   **Základní 21 %:** Většina zboží, IT služby, software, konzultace.
*   **Snížená 15 %:** Potraviny, knihy, ubytování *(změna z 12 %)*
*   **Super-snížená 10 %:** Vybrané zdravotnické služby, zdravotnické pomůcky.

### Kdy se musíte registrovat?
Povinně, pokud obrat překročí **1 750 000 Kč** za 12 po sobě jdoucích měsíců.
*Změna z roku 2024:* Práh se snížil z 2 mil. Kč! To znamená dřívější povinná registrace.

---

# Výpočet DPH — Příklad 2026

Jste IT freelancer (plátce DPH) a fakturujete vytvoření webu.

1.  **Vaše cena (Základ daně):** 50 000 Kč
2.  **DPH (21 %):** $50\,000 \times 0,21 = 10\,500 \text{ Kč}$
3.  **Celkem k úhradě:** 60 500 Kč

**Zároveň** si koupíte nový notebook za 30 000 Kč (+ 6 300 Kč DPH).

**Odvod státu:**
$$ \text{Výstupní DPH} (10\,500) - \text{Vstupní DPH nárok} (6\,300) = \mathbf{4\,200 \text{ Kč}} $$

**Pozn.:** Pokud jste registrován, vrátíte si DPH za nákupy. Bez registrace byste DPH strávil jako finální náklad.

---

# Zdanění práce: Zaměstnanec (DPFO 2026)

Jak se počítá **Čistá mzda** z Hrubé mzdy?

**Vzorec:**
$$ \text{Hrubá mzda} - \text{Sociální} - \text{Zdravotní} - \text{Daň (po slevách)} = \text{Čistá mzda} $$

*   **Sociální pojištění (zaměstnanec):** 9,2 % z hrubé mzdy
*   **Zdravotní pojištění (zaměstnanec):** 4,5 % z hrubé mzdy
*   **Daň z příjmu FO:** 15 % (nebo 23 % pro příjmy nad cca 3× průměrnou mzdu)
*   **Mzdové náklady zaměstnavatele:** Hrubá mzda × 1,335 (celkem +33,5 % na odvodech)

---

# Příklad: Výpočet čisté mzdy (2026)

**Hrubá mzda:** 50 000 Kč

1.  **Pojištění (strhává se zaměstnanci):**
    *   Soc: $50\,000 \times 0,092 = 4\,600 \text{ Kč}$
    *   Zdr: $50\,000 \times 0,045 = 2\,250 \text{ Kč}$
2.  **Výpočet Daně (záloha):**
    *   Hrubá daň: $50\,000 \times 0,15 = 7\,500 \text{ Kč}$
    *   Sleva na poplatníka (základní): cca 2 600 Kč
    *   Daň po slevě: $7\,500 - 2\,600 = 4\,900 \text{ Kč}$
3.  **Čistá mzda:**
    $50\,000 - 4\,600 - 2\,250 - 4\,900 = \mathbf{38\,250 \text{ Kč}}$

**Mzdové náklady zaměstnavatele:** $50\,000 \times 1,335 = 66\,750 \text{ Kč}$

---

# Zdanění podnikání: OSVČ (Freelancer) — 2026

IT specialista (OSVČ) má 3 hlavní režimy zdanění:

1.  **Reálné výdaje:** Vede daňovou evidenci (příjmy minus výdaje). Pro IT málo výhodné.
2.  **Paušální výdaje (NEJPOPULÁRNĚJŠÍ):**
    *   Pro IT lze uplatnit **60 %** příjmů jako fiktivní výdaj.
    *   Daní se jen zbylých 40 % zisku.
    *   Super-jednoduché!
3.  **Paušální daň (Flat Tax) — NOVÝ REŽIM:**
    *   Jedna platba měsíčně zahrnuje daň, zdrav. i soc. pojištění.
    *   **0 Kč pro příjmy do 400 000 Kč ročně** (nová hranice!)
    *   Pak postupně: 5 472 Kč → 32 832 Kč (podle příjmů).

---

# OSVČ: Paušální výdaje — Příklad

**Příjem z IT projektu:** 100 000 Kč

### Režim A: Paušální výdaje (60 %)
- Příjmy: 100 000 Kč
- Výdaje (paušál 60 %): −60 000 Kč
- **Základ daně:** 40 000 Kč
- Daň (15 %): 6 000 Kč
- **Sociální pojištění (min):** ~3 428 Kč/měsíc
- **Zdravotní pojištění (min):** ~2 393 Kč/měsíc

### Režim B: Paušální daň (nový!)
- Měsíční platba (příjem 100 k/měsíc = 1,2 mil./rok): cca **11 000 Kč** (vše zahrnuto!)
- Veškerá administrativa zautomatizovaná
- Žádné vedení účetnictví

**Vítěz pro 100 k/měsíc:** Paušální daň (11k vs. 6k daň + pojištění)!

---

# DVPP: Daň z příjmů právnických osob (s.r.o.)

Pokud založíte **s.r.o.** (startup, softwarová firma):

*   Předmětem daně je zisk společnosti (Výnosy − Náklady).
*   **Sazba daně:** **19 %** (od 2024; nezměnilo se)

### Výhody s.r.o.:
*   Omezené ručení (limitované riziko)
*   Možnost opakovaného využití firmy (na rozdíl od OSVČ, která je vázána na fyzickou osobu)
*   Prestiž, lepší podmínky u bank

### Nevýhody:
*   **Dvojí zdanění:** Zisky jsou zdaněny na úrovni s.r.o. (19%), pak když si je vyplatíte jako majitel, zdaní se znovu (15% srážková daň na podíly)
*   Povinná účetnictví (dražší administrativu)
*   Registr rejstříku, notář (~5 000 Kč na začátku)

---

# Daňová optimalizace: Legální strategie

### 1. Výběr správného právního režimu
| Příjem/rok | Nejlepší volba | Čistý zisk (%) |
| :--- | :--- | :--- |
| **0–400 k Kč** | Paušální daň OSVČ | 100 % (0 Kč daň!) |
| **400k–1,75 mil** | OSVČ (paušál 60 %) | ~75–80 % |
| **>1,75 mil** | OSVČ nebo s.r.o. | závisí na struktuře |

### 2. Timing DPH registrace
- **Před 1,75 mil. Kč:** Není DPH povinný → nákupy jsou finální náklad
- **Po 1,75 mil. Kč:** Povinný DPH → vrátí si DPH za nákupy

**Dobrá praxe:** Sledovat obrat před dosažením prahu a včas se zaregistrovat!

---

# Legální daňové únikal: Situace "Nové firmy" (2M Kč práh)

### Původní problém (do 2024):
Podnikatel s obratem 1,9 mil. Kč si mohl "najít cestu" k tomu, aby se vyhnul registraci DPH:
- Vybrat si OSVČ status (bez DPH povinnosti)
- Nákupovat bez DPH refundace (ale ušetřit na DPH nákladech v daňových výdajích)

### Reforma 2026:
Práh se **snížil z 2 mil. na 1,75 mil. Kč**!
- Cíl: Zabránit zneužívání daňových věcí
- Efekt: Více podnikatelů musí být na DPH

### Legální optimalizace (kterou lze dělat i teď):
- Rozdělit obrat mezi více osob/firem (JV, pronájem práce)
- Zůstat pod 1,75 mil. Kč a nechat si menší OSVČ
- Pro s.r.o.: **Divize firmy** (spin-off) před dosažením prahu (avšak s daňovými následky)

---

# Anti-BEPS opatření a daňová rizika (2026)

ČR (jako EU) zavedla přísná pravidla proti agresi daňovému plánování:

### 1. Zákaz "Base Erosion and Profit Shifting"
*   Limity na úrokové náklady: Firmy s příjmy **>30 mil. Kč** nesmí odečíst více než 30 % EBIT na úroky.
*   Dopad: **Velké s.r.o. s půjčkami od majitele** budou mít problém.

### 2. Transfer pricing (Transferové ceny)
*   Služby mezi vaší českou firmou a zahraničními větvemi/máterskou společností musí mít "tržní cenu"
*   Dopad: **Consultanti a freelancers v IT** musí dokumentovat, proč si vezou právě takový tarif.

### 3. Mandatory Disclosure Rules (MDR)
*   **Od 2026:** Daňoví poradci musí hlásit státu "podezřelé" daňové schémata.
*   Dopad: Méně prostoru pro "kreativní daňové řešení".

### Rada: Pokud něco vypadá příliš dobře, aby bylo pravda, je to asi šedá zóna.

---

# Praktické příklady: Employee vs OSVČ vs s.r.o.

### Scénář: Nový IT specialista s příjmem 60 k Kč/měsíc = 720 k Kč/rok

| Aspekt | **Zaměstnanec** | **OSVČ (60% paušál)** | **s.r.o.** |
| :--- | :--- | :--- | :--- |
| **Hrubý příjem** | 60 000 | 60 000 | 60 000 |
| **Daň + pojištění** | ~15 000 | ~5 500 | ~11 400 (daň 19%) |
| **Čistý příjem** | ~45 000 | ~54 500 | ~48 600 |
| **Administrativa** | Nula | Minimální | Výrazná |
| **Riziko** | Zaměstnavatel nese | Já neru | Omezené |
| **Flexibilita** | Nula | Vysoká | Střední |

**Vítěz pro tuto výši příjmu:** OSVČ s paušálními výdaji (54 500 Kč čistého)!

---

# Daňová optimalizace: Výše zmíněné chyby

### Chyby, které dělají novičci:

1. **Nezaregistrování se na DPH včas**
   - Ztratí si vrácení DPH na nákupech (HW, software)
   - Řešení: Hlídat obrat, dobrovolná registrace když je výhodná

2. **Vedení OSVČ bez registrace**
   - Některé banky nevěří, že jste právně existujete
   - Řešení: I bez DPH povinnosti si podat registraci

3. **Přehlížení minimálních odvodů na sociální pojištění**
   - Pokud OSVČ vede, musí platit minimálně ~3 400 Kč/měsíc
   - Řešení: Kontrolovat minimální hranice ročně (indexují se)

4. **Špatná volba paušálního režimu u nízko-příjmových OSVČ**
   - Ročně do 400 k Kč → paušální daň 0 Kč, ale musí se zaregistrovat
   - Řešení: Věrit na nový paušální režim (často nezná podnikatelů)

---

# Praktické kroky: Jak optimalizovat daně

### Pro zaměstnance:
1. Kontroluj si daňové zálohování a slevami (např. sleva na prvního manžela/manželku)
2. Zeptej se zaměstnavatele na "stravenky" nebo "penzijní příspěvky" (nejsou zdaňovány)
3. Sbírej faktury za vzdělání, kvalifikaci (mohou být daňově vymáhavé)

### Pro OSVČ:
1. **Zvol správný režim:** Paušální daň (do 400 k) nebo 60% paušál (výše)
2. **Vedení účetnictví:** Ani minimální (daňová evidence), maximálně v Excelu
3. **Investuj v těch "správných" chvílích:** Nákup HW těsně před registrací na DPH (vrátíš si DPH)
4. **Minimální pojištění:** Zaregistruj se na správnu výši (splácet můžeš online)

### Pro s.r.o.:
1. Rozděl příjmy (opakovaně) v rámci roku, aby nevznikly nové daňové povinnosti
2. Investuj zisky zpět do R&D (lze odpočítávat a mít nižší zdanění)
3. Kontroluj transfer pricing, pokud máte zahraniční spolupracovníky

---

# Daňový kalendář pro rok 2026

| Termín | Co dělat? |
| :--- | :--- |
| **Každý měsíc** | Zaplatit sociální a zdravotní pojištění (OSVČ) |
| **Každý měsíc** | Nákup HW/služeb se DPH (pokud jsi plátce) |
| **Konec února** | Podání daňového přiznání za předchozí rok |
| **Konec března** | Úhrada zbytku daně (pokud je splatná) |
| **Průběžně** | Kontrolovat obrat (je-li pod/nad 1,75 mil. Kč) |
| **Prosinci** | Plánovat optimalizaci na příští rok |

---

# Nejčastější chyby podnikatelů

❌ **"Nezaregistruji se na DPH, žádnou DPH neplatím!"**
- Realita: Bez DPH zbývá ti 79 % ceny (21 % je ztráta)

❌ **"Paušální daň je draha!"**
- Realita: Pro příjmy do 1 mil. Kč je to nejlevnější volba

❌ **"Transfer pricing? To já nemusím řešit!"**
- Realita: Pokud máš zahraniční obchody, státní úřad to zkontroluje

❌ **"Minimální pojištění se nemusí platit, když nemám příjmy."**
- Realita: Musíš platit minimálně, jinak ti vznikne dluh státu

---

# Zdroje a kontakty

### Oficiální zdroje:
- **Finanční správa ČR:** https://www.fs.cz (aktuální sazby, formuláře)
- **Portál moje daně:** Podání daňového přiznání online
- **Online kalkulačky:** Výpočet DPH, čisté mzdy, pojištění

### Doporučeni:
- Konzultovat s **daňovým poradcem** (vždy, když si nejsi jistý)
- Nahlédnout do **Zákona o daních z příjmů** (aktuální znění)
- Sledovat **novely daňových zákonů** (probíhají pravidel změny)

### Pro IT specialisty:
- Zvážit **software pro účetnictví** (Fakturoid, Pohoda, Wave)
- Automatizovat platby pojištění (lze nastavit stálé příkazy)

---

# Shrnutí: Klíčová čísla pro praxi (2026)

| Metrika | Hodnota |
| :--- | :--- |
| **DPH - Standardní sazba** | 21 % |
| **DPH - Registrační práh** | **1 750 000 Kč** ⬇️ (nově!) |
| **DPFO (zaměstnanec)** | 15 % |
| **DPPO (s.r.o.)** | 19 % |
| **OSVČ - Paušální výdaje (IT)** | 60 % |
| **OSVČ - Paušální daň (do 400k)** | **0 Kč** ✨ (nově!) |
| **Sociální pojištění zaměstnance** | 9,2 % |
| **Zdravotní pojištění zaměstnance** | 4,5 % |
| **Minimální měsíční pojištění OSVČ** | ~5 821 Kč |

---

# Prostor pro dotazy

**Děkuji za pozornost!**

*Zdroje: Finanční správa ČR (FS.cz), Zákon o daních z příjmů 2026, Zákon o DPH 2026, antirecyklační opatření EU*

**Připraveno pro:** PEM — Právo a ekonomika pro informatiky
**Rok:** 2026
