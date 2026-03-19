# Loess regrese a mnohonásobná regrese

## Sergii Babichev

```text
Univerzita Jana Evangelisty Purkyně v Ústí nad Labem
sergii.babichev@ujep.cz
```

## Úkol 1: Porovnání LOESS a polynomiální regrese

```text
Cíl: Porovnat predikční schopnost LOESS a polynomiální regrese pro modelování vztahu
mezi atributy v datové sadě Syntheticdataset1.csv. Cílová proměnná: Y.
```

```text
Postup:
```

1. Rozdělte data na trénovací a testovací množinu (70/30).
2. Natrénujte LOESS model pouze na trénovacích datech.
3. Natrénujte polynomiální regresi. Stupeň polynomu vyberte pomocí RMSE.
4. Vyhodnoťte predikční výkon obou modelů na testovací množině:

   ```text
   RMSE, R^2
   ```

5. Proveďte vizuální porovnání skutečných a predikovaných hodnot.
6. Diskutujte rozdíl mezi flexibilitou LOESS a parametrickou povahou polynomiální
   regrese.

## Úkol 2: Mnohonásobná lineární regrese

```text
Datová sada: Houseprice.csv
Postup:
```

1. Průzkum dat (EDA):
   Identifikujte cílovou proměnnou.
   Analyzujte chybějící hodnoty.
2. Diagnostika prediktorů:
   Vypočtěte korelační matici.
   Analyzujte korelační matici prediktorů a diskutujte možné projevy
   multikolinearity.
3. Rozdělení dat: 70% train, 30% test
4. Odhad parametrů modelu (na train set):

   ```text
   Y = β0 + β1X1 + ··· + βpXp + ε
   ```

5. Statistická interpretace:
   t-test koeficientů,
   F-test celého modelu,
   Adjusted R^2.
6. Predikční hodnocení (na test set): RMSE, R^2
