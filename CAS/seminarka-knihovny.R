library(czso)
ctlg <- czso::czso_get_catalogue()
dfschema <- czso::czso_get_table_schema("---")
df <- czso_get_table("---")


library(eurostat)
eurdf <- eurostat::get_eurostat("nazev")
# Get the list of available datasets
