########################
# nactete data Ichs
load("Ichs.RData")

######################
## Kategoricka promenna v linearnim modelu
Smok <- Ichs$Kour
plot(hmot ~ Smok)
lm(hmot ~ Smok)
summary(lm(hmot ~ Smok))
# vidim vyznamnost dummy promennych
anova(lm(hmot ~ Smok))
# vyznamnost cele promenne dohromady 

#####################
### Interakce v ANOVe - dvojne trideni

# Jak hmotnost zavisi na koureni a cholesterolu?
library(RcmdrMisc)
library(car)

hmot <- Ichs$hmot
vyska <- Ichs$vyska
Cholest <- Ichs$Cholest
Smok <- Ichs$Kour
plotMeans(hmot, Smok, Cholest, error.bars = "se", connect = TRUE, legend.pos = "farright")
plotMeans(hmot, Smok, Cholest, error.bars = "conf.int", connect = TRUE, legend.pos = "farright")
Anova(aov(hmot ~ Smok * Cholest))

# ANOVA pres regresni model
summary(lm(hmot ~ Smok * Cholest))
Anova(lm(hmot ~ Smok * Cholest))
# hmotnost se v zavislosti na jednotlivych promennych nelisi
Anova(lm(hmot ~ Smok))
plot(hmot ~ Smok)
Anova(aov(hmot ~ Cholest))
plot(hmot ~ Cholest)

#######################
### Multiple linear regression

# Jak systolicky tlak zavisi na hmotnosti, koureni a vysce?
# takto komplikovanou zavislost nelze zobrazit
#   pomohou dilci grafy

# Zavislost na hmotnostni a cholesterolu
syst <- Ichs$syst
hmot <- Ichs$hmot
Cholest <- Ichs$Cholest
plot(syst ~ hmot, pch = 19, col = as.integer(Cholest))
abline(lm(syst[as.integer(Cholest) == 1] ~ hmot[as.integer(Cholest) == 1]), col = 1)
abline(lm(syst[as.integer(Cholest) == 2] ~ hmot[as.integer(Cholest) == 2]), col = 2)
# Zavislost se podle cholesterolu nelisi

# Zavislost na hmotnosti a koureni
Kour <- Ichs$Koureni
plot(syst ~ hmot, pch = 19, col = as.integer(Kour))
abline(lm(syst[as.integer(Kour) == 1] ~ hmot[as.integer(Kour) == 1]), col = 1)
abline(lm(syst[as.integer(Kour) == 2] ~ hmot[as.integer(Kour) == 2]), col = 2)
# v zavislosti na koureni jsou urcite rozdily videt

model1 <- lm(syst ~ hmot * Kour * vyska)        
summary(model1)
# model se vsemi promennymi z nejz budem postupne vynechavat

# Rucne: krokova regrese metoda backward (zpetna) 
# nejvetsi inerakce neni vyznamna
model2 <- lm(syst ~ hmot * Kour + vyska * Kour + vyska * hmot)
summary(model2)
# nejprve se vynechavaji nevyznamne interakce

model3 <- lm(syst ~ hmot * Kour + vyska * Kour)
summary(model3)

model4 <- lm(syst ~ hmot + vyska * Kour)
summary(model4)

model5 <- lm(syst ~ hmot + vyska + Kour)
summary(model5)
# az kdyz jsou vynechany nevyznamne interakce, je mozne vynechavat samostatne promenne, 
#   ktere nejsou obsazeny v interakcich

model6 <- lm(syst ~ hmot + Kour)
summary(model6)

# Coefficient of determination
summary(model1)$r.squared
summary(model2)$r.squared
summary(model3)$r.squared

# Krokova regrese
model.st <- step(lm(syst ~ hmot * Kour * vyska))
summary(model.st)
# automaticka procedura, ktera hleda optimalni model na zaklade Akaikeho kriteria
AIC(model.st)
# u vysledneho modelu je treba zkontrolovat, zda nelze jeste zjednodusit

# Krokova regrese s vyuzitim Bayesovskeho informacniho kriteria
n <- length(syst)  
model.st2 <- step(lm(syst ~ hmot * Kour * vyska), k = log(n))
summary(model.st2)
# zde vychazi stejne

# U vysledneho modelu je treba otestovat predpoklady
par(mfrow = c(2, 2))
plot(model.st)
par(mfrow = c(1, 1))
# z grafu je videt mensi problem s normalitou dat
# kontrola dvou stezejnich predpokladu ciselnym testem

## normalita: H0: normalni rozdeleni vs. H1: neni normalni rozdeleni
shapiro.test(residuals(model.st))
# p = 5.453e-05 < alfa = 0.05 => zamitame normalitu, predpoklad neni splnen
## stabilita rozptylu: H0: rozptyl je stabilni vs. H1. rozptyl neni stabilni
library(lmtest)
bptest(model.st)
# p = 0.7857 > alfa = 0.05 => nezamitame stabilitu rozptylu, predpoklad je splnen
vif(model.st)
# obe hodnoty nizke, problem s multikolinearitou neni

## Jak resit problem s normalitou?
# transformace zavisle promenne
ln.syst <- log(Ichs$syst)

model.ln <- lm(ln.syst ~ hmot * Kour * vyska)
summary(model.ln)
# neni nic videt
model.lns <- step(model.ln)
summary(model.lns)
# vysly stejne vyznamne promenne
par(mfrow = c(2, 2))
plot(model.lns)
par(mfrow = c(1, 1))
## normalita: H0: normalni rozdeleni vs. H1: neni normalni rozdeleni
shapiro.test(residuals(model.lns))
# je zrejme, ze normalita se zlepsila

# Jina moznost je vynechat problematicke pozorovani na osmem radku
Ichs2 <- Ichs[-8,]
# optimalni model
model.st3 <- step(lm(syst ~ hmot * Koureni * vyska, data = Ichs2))
summary(model.st3)
# testy predpokladu
par(mfrow = c(2, 2))
plot(model.st3)
par(mfrow = c(1, 1))
shapiro.test(residuals(model.st3))
bptest(model.st3)
# vsechny predpoklady jsou splneny

### Interpretace regresnich koeficientu
# koeficient u hmotnosti:
#   Pri narustku hmotnosti o 1 kg vzroste systolicky tlak v prumeru o 0.45 jednotek
#     pri stejne kategorii koureni.
# koeficient u koureni:
#   Nekuraci maji v prumeru o 8.8 jednotek vyssi systolicky tlak nez kuraci,
#     pri stejne hmotnosti

##########################
#### Samostatne
# Uvazujte data mtcars
data(mtcars)


# Na cem zavisi sila vozu, promenna hp? Promenne cyl, vs, am a gear uvazujte jako kategoricke.
# Jaky je rozdil mezi automatickou a manualni prevodovkou (promenna am)?
# Je dulezita interakce vs a disp? A co interakce vs a am? A interakce am a disp?
# A co kdyz pridam jeste interakce vs a am s mpg?
# Kolik procent variability se vyslednym modelem vysvetli? 
# Jsou splneny predpoklady?
# Spoctete predpoved ...

# hp <- mtcars$hp
# cyl <- as.factor(mtcars$cyl)
# vs <- as.factor(mtcars$vs)
# am <- as.factor(mtcars$am)
# gear <- as.factor(mtcars$gear)
# disp <- mtcars$disp
# mpg <- mtcars$mpg

# auta.lm1 <- lm(hp ~ cyl * vs * am * gear, data = mtcars)
model_mtcars <- lm(
  hp ~ mpg + disp + wt + qsec + carb + drat + as.factor(cyl) + as.factor(vs) 
  + as.factor(am) + as.factor(gear) + as.factor(vs)*disp + , data = mtcars
  )
summary(model_mtcars)
par(mfrow = c(2, 2))
plot(model_mtcars)
par(mfrow = c(1, 1))
shapiro.test(residuals(model_mtcars))
bptest(model_mtcars)

model_mtcars2 <- lm(
  hp ~ mpg * disp * wt * carb * drat * as.factor(cyl) * as.factor(vs) 
  * as.factor(am) * as.factor(gear), data = mtcars
)
summary(model_mtcars2)
par(mfrow = c(2, 2))
plot(model_mtcars2)
par(mfrow = c(1, 1))
shapiro.test(residuals(model_mtcars2))
bptest(model_mtcars2)

auta.st <- step(model_mtcars2)
summary(auta.st)
par(mfrow = c(2, 2))
plot(auta.st)
par(mfrow = c(1, 1))
shapiro.test(residuals(auta.st))
bptest(auta.st)




