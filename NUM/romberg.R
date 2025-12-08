Romberg <- function(f, a, b, n = 2){
  m <- 2^n
  h <- (b - a) / m
  x <- a + h * (1:(m - 1))
  y <- f(x)
  res <- numeric(n)
  
  odd <- seq(1, m, 2)
  pocetHodnot <- m
  nasobic <- 1
  for (i in n:1){
    h <- 2*h
    pocetHodnot <- pocetHodnot / 2
    sekvence <- odd[1:pocetHodnot]
    res[i] <- h * sum(y[sekvence])
    y <- y[-sekvence]
  }
  A <- matrix(0, n, n)
  A[,1] <- res
  nasobic <- 1
  for (j in 2:n){
    nasobic <- nasobic * 4
    A[j:n, j] <- (nasobic * A[j:n, j - 1] - A[j - 1:(n - j + 1), j - 1]) / (nasobic - 1)
  }
  return(A)
}

RombergJancerik <- function(f, a, b, n = 2){
  m <- 2^n
  h <- (b - a) / m
  x <- a + h * (1:(m - 1))
  y <- f(x)
  res <- numeric(n)
  
  sekvence <- seq(1, m, 2)
  pocetHodnot <- m
  nasobic <- 1
  for (i in n:1){
    h <- 2*h
    res[i] <- h * sum(y[sekvence])
    pocetHodnot <- pocetHodnot / 2
    sekvence <- 2 * sekvence[1:pocetHodnot/2]
    y <- y[-sekvence]
  }
  A <- matrix(0, n, n)
  A[,1] <- res
  nasobic <- 1
  for (j in 2:n){
    nasobic <- nasobic * 4
    A[j:n, j] <- (nasobic * A[j:n, j - 1] - A[j - 1:(n - j + 1), j - 1]) / (nasobic - 1)
  }
  return(A)
}

Romberg(sin, 0, pi, 5)