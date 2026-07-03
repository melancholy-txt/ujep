# ZADÁNÍ
# y'(x) - y + x = 0
# pro které platí: určitý integrál od 0 do 1 y(x)dx = 2

# Bisekce
bisection <- function(f, a, b, tol = 1e-6, maxIter = 100) {
  # Výpočet hodnot na krajích intervalu
  fa <- f(a)
  fb <- f(b)

  # Ověření, že na intervalu je změna znaménka
  # Pokud f(a)*f(b) > 0, metoda nemá zaručeno, že se v intervalu nachází kořen.
  if (fa * fb > 0) {
    cat("Chyba: Na intervalu není změna znaménka — nelze zaručit kořen.\n")
    return(NULL)
  }

  # Inicializace proměnné pro střed intervalu
  c <- NA

  # Iterační smyčka
  for (i in 1:maxIter) {
    c <- (a + b) / 2          # výpočet středu intervalu
    fc <- f(c)                # hodnota funkce v bodě c

    # Kritérium přesnosti 
    # Pokud je f(c) blízko nule nebo délka intervalu je menší než tolerance
    if (abs(fc) < tol || (b - a) / 2 < tol) {
      cat(sprintf("Konvergence dosažena po %d iteracích.\n", i))
      return(c)
    }

    # --- Výběr nové poloviny intervalu ---
    # Zvolí se ta část, kde dochází ke změně znaménka (kořen musí být tam)
    if (fa * fc < 0) {
      b <- c
      fb <- fc
    } else {
      a <- c
      fa <- fc
    }
  }

  # Pokud metoda nedosáhne konvergence v daném počtu iterací
  cat("Varování: Metoda nedosáhla požadované přesnosti.\n")
  return(NULL)
}

# Runge-Kutta
RK4 <- function(f, x, y, h) {
  k1 <- f(x, y)
  k2 <- f(x + h/2, y + (h/2)*k1)
  k3 <- f(x + h/2, y + (h/2)*k2)
  k4 <- f(x + h,   y + h*k3)
  y + (h/6) * (k1 + 2*k2 + 2*k3 + k4)
}

# Simpsonova metoda pro integraci
simpson <- function(f, a, b, n = 1) {
  h <- (b - a) / n
  suma <- f(a) + f(b) + 4 * (sum(f(a + h * (1:n) - h / 2)))
  if (n > 1) suma <- suma + 2 * sum(f(a + h * (1:(n - 1))))
  return(h * suma / 6)
}


# Počáteční podmínka a interval

x0 <- 0
y0 <- 0.5
xmin <- 0
xmax <- 3
h <- 0.01

x <- seq(xmin, xmax, by = h)
steps <- length(x)


# Předalokace řešení pro jednotlivé metody

y_RK4 <- numeric(steps)


y_RK4[1] <- y0


# Numerické řešení ODE

for (i in 2:steps) {
  x_prev <- x[i-1]
  y_RK4[i] <- RK4(f, x_prev, y_RK4[i-1], h)
}


# Analytické řešení pro porovnání
# y(x) = (x+1)^2 - 0.5 * e^x

y_exact <- (x + 1)^2 - 0.5*exp(x)

# Grafické porovnání metod

plot(x, y_RK4, type="l", col="red", lwd=3.5,
     xlab="x", ylab="y(x)",
     main="Numerické řešení ODE – porovnání")

lines(x, y_exact, col="green", lwd=1.5)

legend("topleft",
       legend=c("RK4", "Analytické řešení"),
       col=c("red","green"),
       lty=1, lwd=c(1,2), bty="n")