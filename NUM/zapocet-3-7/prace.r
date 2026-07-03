RK4 <- function(f, x, y, h) {
  k1 <- f(x, y)
  k2 <- f(x + h/2, y + (h/2)*k1)
  k3 <- f(x + h/2, y + (h/2)*k2)
  k4 <- f(x + h,   y + h*k3)
  y + (h/6) * (k1 + 2*k2 + 2*k3 + k4)
}

bisection <- function(f, a, b, tol = 1e-6, maxIter = 100) {
  fa <- f(a)
  fb <- f(b)

  if (fa * fb > 0) {
    cat("Chyba: Na intervalu není změna znaménka — nelze zaručit kořen.\n")
    return(NULL)
  }

  c <- NA
  for (i in 1:maxIter) {
    c <- (a + b) / 2          # výpočet středu intervalu
    fc <- f(c)                # hodnota funkce v bodě c      

    print(sprintf("Iterace %d: a=%f, b=%f, c=%f, f(c)=%f", i, a, b, c, fc))

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

  cat("Varování: Metoda nedosáhla požadované přesnosti.\n")
  return(NULL)
}


simpson <- function(f, a, b, n = 1) {
  h <- (b - a) / n
  suma <- f(a) + f(b) + 4 * (sum(f(a + h * (1:n) - h / 2)))
  if (n > 1) suma <- suma + 2 * sum(f(a + h * (1:(n - 1))))
  return(h * suma / 6)
}

# diferencialni rovnice: y' - y + x = 0  =>  y' = y - x
f_ode <- function(x, y) {
  return(y - x)
}

# ucely funkce pro bisekci (jedina vec co se meni je pocatecni podminka C)
objective_function <- function(C) {
  
  # kroky pro RK4
  h_rk <- 0.01
  x_rk <- seq(0, 1, by = h_rk)
  steps <- length(x_rk)
  
  y_rk <- numeric(steps)
  y_rk[1] <- C  
  
  for (i in 2:steps) {
    y_rk[i] <- RK4(f_ode, x_rk[i-1], y_rk[i-1], h_rk)
  }

  # dosazujeme hodnoty do integralu
  f_vlastni <- function(x_val) {
    indexy <- round(x_val / h_rk) + 1
    return(y_rk[indexy])
  }
  
  integral_val <- simpson(f_vlastni, a = 0, b = 1, n = 50)
  
  # proste chceme aby integral byl 2
  return(integral_val - 2)
}


# zkusime dosadit za C = 1
vysledek_y0 <- bisection(objective_function, a = -2, b = 5)

cat("\nNalezena pocatecni hodnota y(0) je:", vysledek_y0, "\n")
cat("Analyticky to ma byt:              ", 1 / (2 * (exp(1) - 1)) + 1, "\n")