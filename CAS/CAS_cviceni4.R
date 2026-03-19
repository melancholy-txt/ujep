# Autokorelacni a parcialni autokorelacni funkce 
data(lh)
  # Luteinizing Hormone in Blood Samples
plot(lh)
  # v rade neni evidentni zadny trend ani sezonnost

# autokovariancni funkce
acf(lh, type = "covariance")
acf(lh, type = "covariance", plot = F)
  # vypis hodnot, prvni z nich je rozptyl rady
  var(lh)
# autokorelacni funkce
acf(lh)
acf(lh, plot = F)
  # opet si muzeme nechat hodnoty vypsat
# parcialni autokorelacni funkce
pacf(lh)
  # parcialni autokorelacni funkce
pacf(lh, plot = F)
  # vypis hodnot

# ktere korelace jsou nenulove? Ktere modely pripadaji pro radu v uvahu?
par(mfrow = c(2,1))
acf(lh); pacf(lh)
par(mfrow = c(1,1))
  # nakresleni obou funkci pod sebe

# test na nulovost autokorelacni funkce
Box.test(lh, lag = 2, type = "Ljung-Box")
  # rucne najdete hodnotu, kterou by nemela prekrocit druha autokorelace, pokud chceme,
  #	  aby od druhe dale, byly autokorelace nulove	

# nulovost autokorelacni funkce residui znamena, ze mame spravny model

##########################
### Samostatne
# podivejte se na autorekoralecni a parcialni autokorelacni funkce rad 
  # LakeHuron, lynx, co2, discoveries
plot(LakeHuron)
acf(LakeHuron)
acf(LakeHuron, plot = F)
pacf(LakeHuron)
pacf(LakeHuron, plot = F)

plot(lynx)
acf(lynx)
acf(lynx, plot = F)
pacf(lynx)
pacf(lynx, plot = F)

plot(co2)
acf(co2)
acf(co2, plot = F)
pacf(co2)
pacf(co2, plot = F)

plot(discoveries)
acf(discoveries)
acf(discoveries, plot = F)
pacf(discoveries)
pacf(discoveries, plot = F)
##########################

# pomoci funkce arima.sim(n = ,list(ar = ,ma = )) nasimulujte rady typu
#   MA(1) s parametrem theta1 = 0.75
#   MA(1) s parametrem theta1 = -0.75
#   MA(1) s parametrem theta1 = 1.5
#   AR(1) s parametrem phi1 = 0.75
#   AR(1) s parametrem phi1 = - 0.75
#   AR(1) s parametrem phi1 = 1.5
# podivejte se, jak rady vypadaji a jak vypadaji jejich autokorelacni a parcialni autokorelacni funkce
# nasimulujte bily sum a podivejte se na jeho autokorelacni a parcialni autokorelacni funkci

# podivejte se na radu ldeaths
#   vypoctete jeji autokorelacni a parcialni autokorelacni funkci
#   ocistete ji od trendu a sezonnosti a podivejte se na autokorelacni funkci 
#     a parcialni autokorelacni funkci jejich residui
# stejne pracujte s radou discoveries a WWWusage
