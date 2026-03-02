---
marp: true
theme: default
paginate: true
header: "PEM: Ekonomické výpočty"
footer: "Téma 3: Daně a jejich výpočet"
---

# 3. Různé druhy daní a jejich výpočet
## (DPH, čistá mzda, DPFO/DPPO)

**Předmět:** Právo a ekonomika pro informatiky
**Cíl:** Pochopit daňový systém z pohledu zaměstnance i podnikatele (OSVČ/s.r.o.)

---

# Přehled daňového systému v ČR

Pro informatiky jsou klíčové dvě hlavní skupiny daní:

1.  **Daně přímé** (odvádí poplatník ze svých příjmů)
    *   Daně z příjmů (DPFO - fyzické osoby, DPPO - právnické osoby)
    *   Daň z nemovitých věcí, Silniční daň (pro podnikatele)
    
2.  **Daně nepřímé** (vybírány v cenách zboží a služeb)
    *   **DPH** (Daň z přidané hodnoty)
    *   Spotřební daně (líh, tabák, paliva)

---

# DPH (Daň z přidané hodnoty)

Nejdůležitější daň pro podnikání v IT (nákup HW, prodej služeb/licencí).

*   **Princip:** Podnikatel odvede státu rozdíl mezi DPH, kterou vybral od zákazníků (výstup), a DPH, kterou zaplatil dodavatelům (vstup).
*   **Sazby (2024/2025):**
    *   **Základní 21 %:** Většina zboží, IT služby, software, konzultace.
    *   **Snížená 12 %:** Potraviny, ubytování, zdravotnické pomůcky.
    *   **Nulová 0 %:** Knihy (i e-knihy).

### Kdy se musíte registrovat?
Povinně, pokud obrat překročí **2 000 000 Kč** za 12 po sobě jdoucích měsíců.
*Dobrovolná registrace:* Výhodná, pokud nakupujete drahý HW a chcete vrátit DPH.

---

# Výpočet DPH (Příklad)

Jste IT freelancer (plátce DPH) a fakturujete vytvoření webu.

1.  **Vaše cena (Základ daně):** 50 000 Kč
2.  **DPH (21 %):** $50\,000 \times 0,21 = 10\,500 \text{ Kč}$
3.  **Celkem k úhradě:** 60 500 Kč

**Zároveň** si koupíte nový notebook za 30 000 Kč (+ 6 300 Kč DPH).

**Odvod státu:**
$$ \text{Výstupní DPH} (10\,500) - \text{Vstupní DPH nárok} (6\,300) = \mathbf{4\,200 \text{ Kč}} $$

---

# Zdanění práce: Zaměstnanec (DPFO)

Jak se počítá **Čistá mzda** z Hrubé mzdy?
*(Stav 2025: Zrušena superhrubá mzda, ale nemocenské platí i zaměstnanec)*

**Vzorec:**
$$ \text{Hrubá mzda} - \text{Sociální} - \text{Zdravotní} - \text{Daň (po slevách)} = \text{Čistá mzda} $$

*   **Sociální pojištění (zaměstnanec):** 7,1 % z hrubé mzdy
*   **Zdravotní pojištění (zaměstnanec):** 4,5 % z hrubé mzdy
*   **Daň z příjmu FO:** 15 % (nebo 23 % pro příjmy nad cca 3× průměrnou mzdu)

---

# Příklad: Výpočet čisté mzdy

**Hrubá mzda:** 50 000 Kč

1.  **Pojištění (strhává se zaměstnanci):**
    *   Soc: $50\,000 \times 0,071 = 3\,550 \text{ Kč}$
    *   Zdr: $50\,000 \times 0,045 = 2\,250 \text{ Kč}$
2.  **Výpočet Daně (záloha):**
    *   Hrubá daň: $50\,000 \times 0,15 = 7\,500 \text{ Kč}$
    *   Sleva na poplatníka (základní): $2\,570 \text{ Kč}$
    *   Daň po slevě: $7\,500 - 2\,570 = 4\,930 \text{ Kč}$
3.  **Čistá mzda:**
    $50\,000 - 3\,550 - 2\,250 - 4\,930 = \mathbf{39\,270 \text{ Kč}}$

*(Pozn.: Zaměstnavatel za vás odvede dalších cca 33,8 % na odvodech navíc, tzv. mzdové náklady).*

---

# Zdanění podnikání: OSVČ (Freelancer)

IT specialista (OSVČ) má 3 hlavní režimy zdanění:

1.  **Reálné výdaje:** Vede daňovou evidenci (příjmy minus výdaje). Pro IT málo výhodné (nízké náklady).
2.  **Paušální výdaje (%, nejoblíbenější):**
    *   Pro většinu živností (vč. IT) lze uplatnit **60 %** příjmů jako fiktivní výdaj.
    *   Daní se jen zbylých 40 % zisku.
3.  **Paušální daň (Flat Tax):**
    *   Jedna platba měsíčně zahrnuje daň, zdrav. i soc. pojištění.
    *   **1. pásmo (příjem do 1,5 mil. Kč):** cca 7 498 Kč měsíčně (2024). Obrovská úspora administrativy.

---

# DPPO: Daň z příjmů právnických osob

Pokud založíte **s.r.o.** (např. startup, softwarová firma):

*   Předmětem daně je zisk společnosti (Výnosy - Náklady).
*   **Sazba daně:** **21 %** (zvýšeno od roku 2024 z původních 19 %).

**Rozdíl oproti OSVČ:**
Peníze patří "firmě". Pokud si je chcete vyplatit jako majitel, musíte je zdanit znovu srážkovou daní (15 % podíl na zisku), nebo se ve vlastní firmě zaměstnat.

---

# Shrnutí pro praxi (IT)

| Typ | Klíčové daně | Výhoda | Nevýhoda |
| :--- | :--- | :--- | :--- |
| **Zaměstnanec** | DPFO 15 %, Soc+Zdr | Jistota, placená dovolená, nemocenská | Menší čistý příjem z ceny práce |
| **OSVČ (Paušál)** | DPFO, Soc+Zdr (minima) | **Vysoký čistý zisk** (díky 60% paušálu) | Nulová ochrana zákoníku práce |
| **s.r.o.** | DPPO 21 % | Omezené ručení majetkem, prestiž | Dvojí zdanění při výplatě zisku |

---

# Prostor pro dotazy

**Děkuji za pozornost!**

*Zdroje: Zákon o daních z příjmů, Zákon o DPH (aktuální znění k 2025)*