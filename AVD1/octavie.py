import pandas as pd

df_octavie = pd.read_excel("AVD1/octavie.xlsx", sheet_name="Prodeje")
df_octavie = df_octavie.iloc[:, 4:]

df_prodejci = pd.read_excel("AVD1/octavie.xlsx", sheet_name="Prodejci")

df_prodejci["ID Prodejce"] = df_prodejci["ID"]

df_octavie = df_octavie.merge(df_prodejci, on="ID Prodejce", how="left")   

# create per-region totals and counts
df_regiony = df_octavie.groupby("Region").agg(
    Trzba=("Cena", "sum"),
    Pocet_Prodeju=("Cena", "count")
).reset_index()

# add the per-region sale counts to the main dataframe
df_octavie = df_octavie.merge(df_regiony[["Region", "Pocet_Prodeju"]], on="Region", how="left")

# print(df_regiony.head(10))

print("\nPOČET PRODANÝCH VOZŮ: ", df_octavie.shape[0])

total = df_octavie["Cena"].sum()
formatted_total = f"{total:,.2f}".replace(",", " ").replace(".", ",")
print("\nCELKOVÁ TRŽBA: ", formatted_total, "Kč")

formatted_mean = f"{df_octavie["Cena"].mean():,.2f}".replace(",", " ").replace(".", ",")
print("\nPRŮMĚRNÁ CENA VOZU: ", formatted_mean, "Kč")


print("\nPOČET PRODEJÍ DLE REGIONU:")
print(df_regiony[["Region", "Pocet_Prodeju"]].sort_values(by="Pocet_Prodeju", ascending=False))

print("\nTRŽBY DLE REGIONU:")
df_regiony = df_regiony.sort_values(by="Trzba", ascending=False)
df_regiony["Trzba"] = df_regiony["Trzba"].apply(lambda x: f"{x:,.2f}".replace(",", " ").replace(".", ","))
print(df_regiony[["Region", "Trzba"]])

print("\nPRODEJCI DLE TRŽEB:")
df_prodejci = df_octavie.groupby("Obchodník").agg(
    Trzba=("Cena", "sum"),
    Pocet_Prodeju=("Cena", "count")
).reset_index()
df_prodejci = df_prodejci.sort_values(by=["Pocet_Prodeju"], ascending=False)
df_prodejci["Trzba"] = df_prodejci["Trzba"].apply(lambda x: f"{x:,.2f}".replace(",", " ").replace(".", ","))
print(df_prodejci[["Obchodník", "Pocet_Prodeju", "Trzba"]])