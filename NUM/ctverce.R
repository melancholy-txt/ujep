Horner <- function(a, x){
  n <- length(a)
  res <- 0
  for(i in n:1){
    res <- res*x + a[i]
  }
  return(res)
}

MNCforPolynoms <- function(x, y, n){
  A <- matrix(0, n, n)
  b <- numeric(n)
  
  for(r in 1:n){
    for(s in 1:n){
      A[r, s] <- sum(x^(r + s - 2))
    }
    b[r] <- sum(y * x^(r - 1))
  }

  return(solve(A, b))
}

MNCforPolynomsBetter <- function(x, y, n){
  m <- length(x)
  X <- matrix(1,m, m)
  for(r in 2:m){
    X[r, ] <- X[r - 1, ] * x
  }
  A <- X %*% t(X)
  print(A)
  b <- X %*% y
  print(b)
  
  #return(solve(A, b))
}

MNCforPolynomsGemini <- function(x, y, n){
  # m = počet bodů
  m <- length(x)
  
  # Vytvoříme návrhovou matici X (Vandermonde matrix)
  # Musí mít 'm' řádků (pro každý bod) a 'n+1' sloupců (pro stupně 0, 1, ..., n)
  
  # X[i, j] = x_i^(j-1)
  # Sloupce budou reprezentovat x^0, x^1, x^2, ..., x^n
  # Nejefektivnější způsob v R je použít funkci outer()
  X <- outer(x, 0:n, "^")
  
  # Nyní sestavíme normální rovnice: (t(X) %*% X) %*% beta = t(X) %*% y
  # Kde 'beta' je hledaný vektor koeficientů [a0, a1, ..., an]
  
  # A = t(X) %*% X
  # Toto bude čtvercová matice (n+1) x (n+1)
  A <- t(X) %*% X
  
  # b = t(X) %*% y
  # Toto bude vektor délky (n+1)
  b <- t(X) %*% y
  
  # Vyřešíme soustavu A * beta = b pro neznámý vektor 'beta'
  # Funkce solve(A, b) je efektivnější než počítat inverzní matici
  beta <- solve(A, b)
  
  return(beta)
}

n <- 5

a <- c(1, -2, 3, -5, 12)
x <- seq(0, 1, 0.0001)
m <- length(x)
y <- Horner(a, x) * runif(m, 0.9, 1.1)
plot(x, y)
n <- 5

tb <- Sys.time()
coef <- MNCforPolynoms(x, y, n)
print(Sys.time() - tb)

print("starting better")
tb <- Sys.time()
coefBetter <- MNCforPolynomsBetter(x, y, n)
print(Sys.time() - tb)

lines(x, Horner(coef, x), col="red", lwd=5)
lines(x, Horner(coef, x), col="blue", lwd=5)

print(a)
print(coef)
print(coefBetter)
