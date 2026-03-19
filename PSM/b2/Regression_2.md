# Loess regrese a mnohonásobná regrese

Sergii Babichev

Univerzita Jana Evangelisty Purkyně v Ústí nad Labem sergii.babichev@ujep.cz

# Loess regrese

Loess (nebo LOWESS, z anglického ”Locally Weighted Scatterplot Smoothing”)
je neparametrická regresní technika, která kombinuje několik regresních modelů v meta-modelu založeném na metodě k-nejbližších sousedů. Na rozdíl od lineární nebo logistické regrese, které modelují vztah jednou rovnicí, Loess aplikuje několik regresí v lokálních podmnožinách dat. Tento přístup umožňuje Loess modelovat složitější, nelineární vztahy, které se mohou lišit v různých rozsazích dat.

# Loess regrese

Klíčové charakteristiky regrese Loess:
Lokální regrese: Loess modeluje jednoduché modely na lokálních podmnožinách dat, což je efektivní pro modelování složitých, nelineárních vztahů.
Vážené nejmenší čtverce: V každé lokální podmnožině Loess používá vážené nejmenší čtverce, přičemž větší váhu přikládá bodům nejbližším k cílovému bodu, pro který je model stavěn.
Parametr vyhlazování (šířka pásma): Stupeň vyhlazování je řízen parametrem, často nazývaným šířka pásma nebo rozpětí, který určuje, kolik dat je použito pro vytvoření každého lokálního modelu. Větší šířka pásma zahrnuje více bodů a vede k hladší křivce.
Flexibilita: Loess může zachytit různé druhy struktur v datech bez předpokladu konkrétní globální formy (jako je linearita) pro vztah mezi proměnnými.
Výpočetní náročnost: Vyžaduje více výpočetního výkonu než jednoduchá lineární regrese, zejména pro velké datové sady, protože zahrnuje vytváření mnoha malých modelů.
Robustnost: Pro lepší robustnost vůči outlierům je možné použít Loess s robustní váhovou funkcí, která zmenšuje váhy pro odlehlé hodnoty.

# Loess regrese: Local regrese

# Loess regrese: Loess curve

# Loess regrese: Loess prediction

# Loess regrese

Interpretace:
Identifikace trendů: Loess regrese se primárně používá pro vizualizaci trendu v datech.
Bez koeficientů: Na rozdíl od lineární regrese Loess nevede k jednoduché rovnici nebo koeficientech pro prediktory. Výstupem je hladká křivka, která reprezentuje vztah.
Aplikace:
Vizualizace dat:Často se používá v explorativní analýze dat k vizualizaciˇ
trendu v datovém souboru.
Nelineární vztahy: Užitečné, pokud je vztah mezi proměnnými známý jako nelineární, nebo když chcete prozkoumat povahu vztahu bez předpokladu linearity.
Ekonometrie a epidemiologie: Loess se široce používá v různých vědeckých oborech, včetně ekonometrie, epidemiologie a sociálních věd, kde je třeba analyzovat složité, nelineární vztahy mezi proměnnými.

# Loess regrese

Omezení:
Subjektivita: Volba šířky pásma/vyhlazovacího parametru může být do jisté míry subjektivní a výrazně ovlivňuje výsledný fit.
Přetrénování: Existuje riziko přetrénování, pokud je šířka pásma příliš malá, což vede k modelu, který je příliš úzce vázán na šum v datech.
Extrapolace: Loess není vhodný pro extrapolaci mimo rozsah dat.
Vícedimenzionální data: Zatímco Loess funguje dobře pro univariátní a bivariátní data, jeho aplikace se stává složitější a výpočetně náročnější pro vyšší dimenze dat.
Vysoká složitost: Pro velké soubory dat může být Loess výpočetně náročný, což omezuje jeho použití v reálných časech.

# Mnohonásobná regrese

Mnohonásobná regresní analýza je statistická metoda, která umožňuje analyzovat vztah mezi jednou závislou proměnnou a více nezávislými proměnnými. Tato technika je široce používána v různých oblastech, včetně ekonomie, medicíny a sociálních věd, k odhalování potenciálních příčinných vztahů mezi proměnnými.
Základní pojmy:
Závislá proměnná (Y): Proměnná, kterou chceme vysvětlit nebo předpovědět.
Nezávislé proměnné (Xi): Proměnné, které používáme k předpovídání nebo vysvětlení závislé proměnné.
Koeficienty (βi): Reprezentují míru změny závislé proměnné při změně příslušné nezávislé proměnné o jednotku.
Chybový člen (ε): Reprezentuje část závislé proměnné, kterou nelze vysvětlit pomocí modelu.

# Mnohonásobná regrese

Matematický model: Model mnohonásobné regrese můžeme matematicky vyjádřit jako:
$$
Y = \beta_0 + \beta_1 X_1 + \beta_2 X_2 +··· + \beta_nX_n+ ε (1)
$$
Tento model nám říká, že závislá proměnná Y je lineární funkcí nezávislých proměnných X_1 , X_2 ,..., X_n, přičemž \beta_0 je y-intercept (bod, kde regresní přímka protíná y-ovou osu), \beta_1 ,\beta_2 ,...,\beta_njsou sklonové koeficienty jednotlivých nezávislých proměnných, a ε je chybový termín.
Předpoklady mnohonásobné regrese: Pro validní výsledky mnohonásobné regresní analýzy musí být splněny následující předpoklady:

1. Lineární vztah mezi závislými a nezávislými proměnnými.
2. Nezávislost reziduí (chybových členů).
3. Homoskedasticita reziduí (konstantní rozptyl chybových členů).
4. Normální rozdělení reziduí. 5. Žádná nebo minimální multikolinearita mezi nezávislými proměnnými.

# Koeficient mnohonásobné korelace – interpretace

Definice:
Koeficient mnohonásobné korelace \rho_{Y.X}je maximální možná korelace mezi náhodnou veličinou Y a libovolnou lineární kombinací vektoru X = (X_1 ,..., X_p)⊤:

\rho_{Y.X}= max a̸=
cor (Y, a⊤X ) (2)

Význam:
\rho_{Y.X}∈ [0, 1]
$$
\rho_{Y.X}= 0 – žádná lineární závislost
$$
$$
\rho_{Y.X}= 1 – dokonalá lineární závislost
$$

Nejčastěji používáme druhou mocninu:

ρ^2 Y.X (3)
která vyjadřuje podíl vysvětlené variability Y.

# Matematický tvar koeficientu

Platí vztah:

ρ^2 Y.X= cor (Y, X ) cor (X )−^1 cor (X, Y ) (4)

kde:
cor (Y, X ) – vektor korelací (ρY,X_1 ,...,ρY,X_p)
cor (X ) – korelační matice mezi X_1 ,..., X_p cor (X, Y ) = cor (Y, X )⊤

Rozměry matic:

(1× p) (p× p) (p× 1) = (1× 1)
Výsledkem je skalární hodnota.

# Číselný příklad (2 prediktory)

Necht’platí:

cor (Y, X_1 ) = 0. 80 , cor (Y, X_2 ) = 0. 60 , cor (X_1 , X_2 ) = 0. 50

Korelační matice:

cor (Y, X ) =

## 

## 0. 80 0. 60

## 

cor (X ) =

## 

## 1 0. 50

## 0. 50 1

## 

Nejprve vypočteme inverzi matice cor (X ).

cor (X )−^1 =

## 1

## 1 − 0. 52

## 

## 1 − 0. 50

## − 0. 50 1

## 

## =

## 1

## 0. 75

## 

## 1 − 0. 50

## − 0. 50 1

## 

# Výpočet inverze a mezivýsledek

Následně:

cor (X )−^1

## 

## 0. 80

## 0. 60

## 

## =

## 

## 0. 6667

## 0. 2667

## 

ρ^2 Y.X=

## 

## 0. 80 0. 60

## 

## 

## 0. 6667

## 0. 2667

## 

ρ^2 Y.X= 0. 6933

\rho_{Y.X}=

## √

## 0. 6933 ≈ 0. 833

Interpretace:
Lineární kombinace X_1 , X_2 vysvětluje přibližně

69%
variability veličiny Y.

# Souvislost s lineární regresí

V modelu vícenásobné lineární regrese:

$$
Y = \beta_0 + \beta_1 X_1 +··· + βpX_p+ ε (5)
$$
platí:

R^2 = rY^2 .X (6)

Závěr:
Koeficient mnohonásobné korelace je:
matematickým základem koeficientu determinace, mírou lineární vysvětlitelnosti proměnné Y pomocí X , citlivý na multikolinearitu mezi prediktory.

# Test významnosti celého modelu

Uvažujme model:
$$
Y = \beta_0 + \beta_1 X_1 +··· + βpX_p+ ε
$$
Nulová hypotéza:
H 0 : \beta_1 = \beta_2 =··· = βp= 0
Alternativní hypotéza:

H 1 :∃j takové, že βj̸= 0

Testové kritérium:
F =

SR/p SE/(n− p− 1)
kde:
SR – regresní součet čtverců SE – reziduální součet čtverců

# Rozklad variability

Celková variabilita:

ST = SR + SE kde:
ST =

## P

(Yi−Y ̄ )^2 – celkový součet čtverců SR =

## P

(Yˆi−Y ̄ )^2 – vysvětlená variabilita SE =

## P

(Yi−Yˆi)^2 – nevysvětlená variabilita

Koeficient determinace:

## R^2 =

## SR

## ST

# Vztah mezi F-testem a R^2

Testové kritérium lze vyjádřit pomocí R^2 :

## F =

R^2 /p
(1− R^2 )/(n− p− 1)

Interpretace:
Cím většíˇ R^2 , tím větší hodnota F Pokud F > F 1 −α(p, n− p− 1), zamítáme H 0

F-test je tedy testem významnosti koeficientu determinace.

# Dílčí t-testy regresních koeficientů

Pro každý koeficient βjtestujeme:

H 0 : βj= 0
Testové kritérium:

tj=
βˆj s (βˆj)

kde s (βˆj) je směrodatná chyba odhadu.
Platí:

tj∼ t (n− p− 1)

Pokud |tj| > t 1 −α/ 2 (n− p− 1), koeficient je statisticky významný.

# Parciální význam proměnné

Parciální index determinace:

Rpartial^2 =

## ∆SR

SEreduced

Vyjadřuje
”
čistý“ příspěvek proměnné po odečtení vlivu ostatních proměnných.
Platí vztah:

Fj= tj^2
Test významnosti jednotlivé proměnné je ekvivalentní parciálnímu F-testu.

# Adjustovaný koeficient determinace

Pro penalizaci počtu proměnných používáme:

Radj^2 = 1−

SE/(n− p− 1)
ST/(n− 1)

Vlastnosti:
Může klesnout po přidání nevýznamné proměnné Vhodnější pro porovnávání modelů

Samotné R^2 vždy roste, Radj^2 nikoli.

# Posouzení vlivu jednotlivých nezávislých proměnných

Uvažujme odhadnutý model:

$$
Y = \beta_0 + \beta_1 X_1 +··· + βpX_p+ ε
$$

Interpretace nestandardizovaného koeficientu: βjudává změnu Y (v původních jednotkách) při jednotkové změně Xj, za předpokladu konstantních ostatních proměnných.
V praxi mají proměnné různé jednotky měření (např. roky, Kč, body, procenta).
Problém: Koeficienty βjnelze přímo porovnávat, protože závisí na měřítku proměnných.
Rešení:ˇ Standardizujeme pouze nezávislé proměnné:

Zij=
xij− ̄jx sXj a model odhadujeme ve tvaru:

Y = α 0 + α 1 Z 1 +··· + αpZp+ ε

# Parciální korelační koeficient v regresi

Uvažujme model:

Yi= \beta_0 + \beta_1 xi 1 +··· + βpxip+ εi

Parciální korelační koeficient

rY,Xj·X−j měří korelaci mezi Y a Xjpo odstranění vlivu ostatních proměnných.
Vyjadřuje tedy
”
čistý“ lineární vztah mezi Y a Xj.

# Parciální index determinace

Druhá mocnina parciální korelace:

Rpartial^2 ,j=

##

rY,Xj·X−j

##  2

vyjadřuje podíl variability Y , který vysvětluje proměnná Xjnad rámec již zařazených proměnných.
Platí:

Rpartial^2 ,j=

## ∆SR

SEreduced kde ∆SR je přírůstek regresního součtu čtverců po přidání Xjdo modelu.

# Vztah k testování významnosti

Testujeme hypotézu:

H 0 : βj= 0
Platí vztah:

t^2 j= Fj a zároveň

R^2 partial,j=

tj^2
tj^2 + (n− p− 1)

Parciální korelace, přírůstek SR a t-test jsou ekvivalentní způsoby hodnocení významnosti proměnné.

# Ekvivalence t - a F -testu (jedna proměnná)

Testujeme hypotézu:
H 0 : βj= 0

t-test:
tj=

βˆj s (βˆj)

, tj∼ t (n− p− 1)

Kritérium významnosti:
|tj| > t 1 −α/ 2 (n− p− 1)

F -test:
Fj= tj^2 , Fj∼ F (1, n− p− 1)
Kritérium významnosti:
Fj> F 1 −α(1, n− p− 1)

Platí:
t^21 −α/ 2 (n− p− 1) = F 1 −α(1, n− p− 1)
Závěr: t -test a F -test jsou při testování jedné proměnné ekvivalentní.

# Numerický příklad

Necht’:
n = 30, p = 3, α = 0. 05
Stupně volnosti:
n− p− 1 = 26

Kritické hodnoty:
t 0. 975 (26)≈ 2. 056

## F 0. 95 (1, 26)≈ 4. 23

Ověření ekvivalence:
2. 0562 ≈ 4. 23

# Forward Selection – Algoritmus postupné regrese

Krok 1: Výběr prvního regresoru Vypočítáme párové korelační koeficienty mezi Y a x 1 ,..., xp.
Vybereme proměnnou xis největší absolutní hodnotou korelace.

Krok 2: Testování prvního modelu Sestavíme model:
Y = \beta_0 + \beta_1 xi+ ε
Testové kritérium:
F =

## SR/ 1

SE/(n− 2)

∼ F (1, n− 2)

Pokud:
F > F 1 −α(1, n− 2), zařadíme xido modelu.

# Forward Selection – další kroky

Necht’je v modelu aktuálně k regresorů.
Krok 3: Výběr dalšího regresoru Vypočítáme parciální korelační koeficienty mezi Y a nezahrnutými proměnnými, očištěné o vliv již zařazených k regresorů.
Vybereme proměnnou xjs největší absolutní hodnotou parciální korelace.

Krok 4: Test přírůstku modelu Porovnáme redukovaný model (s k proměnnými) a plný model (s k + 1
proměnnými).
F =

## ∆SR/ 1

SEfull/(n− k − 1)

∼ F (1, n− k − 1)

Pokud:
F > F 1 −α(1, n− k − 1), zařadíme proměnnou xjdo modelu.
Kriterium zastavení: Algoritmus končí, pokud žádná další proměnná nesplní test významnosti.

# Mnohonásobná regrese: Příklad

Šest studentů gymnázia absolvovalo čtyři testy, které

měří následující veličiny:

X1 - přírodovědné vědomosti, X2 – literární vědomosti, X3 – schopnost koncentrace, X4 – logické myšlení. Testy se hodnotí na škále od 1
do 10 (1 = špatný výsledek, 10 = výborný výsledek).
Zajímá nás, kolik bodů můžeme očekávat v testu koncentračních schopností studenta, jestliže známe výsledky testů pro literární schopnosti, přírodovědné schopnosti a logické myšlení.

# Příklad: data a volba proměnných

Máme n = 6 studentů a čtyři testy:
X_1 – přírodovědné vědomosti, X_2 – literární vědomosti, X 3 – schopnost koncentrace, X 4 – logické myšlení.

Cíl: odhadnout očekávanou hodnotu X 3 (koncentrace) na základě X_1 , X_2 , X 4.

Y = X 3 , X = (X_1 , X_2 , X 4 )

Vstupní data: tabulka hodnot (xi 1 , xi 2 , xi 3 , xi 4 ) pro i = 1,..., 6.

# Regresní model a maticový zápis

Uvažujme model:

Yi= \beta_0 + \beta_1 Xi 1 + \beta_2 Xi 2 + β 3 Xi 4 + εi, i = 1,..., n

Maticově:
y = Xβ +ε
kde:

y =

## 

## 

## 

## Y 1

## ..

## .

Yn

## 

## 

## ,^ X =

## 

## 

## 

## 1 X_11 X_12 X_14

## ..

## .

## ..

## .

## ..

## .

## ..

## .

1 X_n 1 X_n 2 X_n 4

## 

## 

, β =

## 

## 

## 

## 

\beta_0
\beta_1
\beta_2
β 3

## 

## 

## 

## 

# OLS odhad koeficientů (krok za krokem)

Krok 1: definujeme rezidua e = y− Xβ
Krok 2: minimalizujeme součet čtverců reziduí

S (β) = e⊤e = (y− Xβ)⊤(y− Xβ)

Krok 3: OLS řešení (normální rovnice)

βˆ = (X⊤X)−^1 X⊤y

Výstup: odhadnuté koeficientyβˆ 0 ,βˆ 1 ,βˆ 2 ,βˆ 3.

# Predikce koncentrace pro studenta

Pro studenta s hodnotami (x 1 , x 2 , x 4 ) je predikce:

Yˆ =βˆ 0 +βˆ 1 x 1 +βˆ 2 x 2 +βˆ 3 x 4

Postup:

(^1) Dosadíme hodnoty (x 1 , x 2 , x 4 ) daného studenta.
(^2) Použijeme odhadyβˆjvypočtené z trénovacích dat.
(^3) Získáme očekávaný počet bodů v testu koncentraceYˆ.
Poznámka: predikce je smysluplná pouze v rozsahu hodnot, které se vyskytují v datech (škála 1–10).

# Kvalita modelu: koeficient determinace R^2

Po odhadu získáme predikceYˆia rezidua ei= Yi−Yˆi.

## ST =

X_n

i =1

(Yi−Y ̄ )^2 , SE =

X_n

i =1

(Yi−Yˆi)^2 , SR = ST − SE

## R^2 =

## SR

## ST

## = 1−

## SE

## ST

Interpretace: R^2 udává, jaká část variability koncentrace Y je vysvětlena pomocí
(X_1 , X_2 , X 4 ).

# Významnost koeficientů: t -test

Testujeme pro každý koeficient:

H 0 : βj= 0

tj=

βˆj s (βˆj)

, tj∼ t (n− p− 1)

Kritérium (dvoustranný test):

|tj| > t 1 −α/ 2 (n− p− 1)

Závěr: pokud je koeficient významný, proměnná přispívá k vysvětlení Y nad rámec ostatních proměnných v modelu.
