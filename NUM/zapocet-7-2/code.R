# načtení dat z textového souboru
#data <- read.table("data.txt", header = TRUE, sep = "\t")

#načtení z R environmentu
p <- data$p
L <- data$L
print(p)
print(L)

# linearizace dat
# log(L) <- a*log(p) + (p-1)*log(beta)

a <- log(L)/log(p)
a[1] <- 0
a[21] <- 0
print(a)
beta <- exp(log(L)/(p-1))
beta[1] <- 0
beta[21] <- 0
print(beta)


# VSTUPY:
#   x – vektor bodů (např. náhodně z intervalu [0, 2π])
#   y – odpovídající hodnoty funkce f(x)
#   Phi(x) – funkce vracející vektor bázových funkcí (např. [1, x, x^2, ...])
# VÝSTUP:
#   a – vektor koeficientů aproximační funkce, která v nejmenším čtvercovém smyslu přibližuje y ~ A^T * a


# Gaussova eliminace s částečným pivotováním

GaussEliminationPivoting <- function(A, b){
  N <- length(b)
  Ab <- cbind(A, b)               # vytvoření rozšířené matice [A|b]
  # přímý chod
  for(p in 1:(N-1)){
    imax <- which.max(abs(Ab[p:N, p])) + p - 1  
    # nalezení řádku s největším prvkem ve sloupci p (pivot)
    if(imax != p){
      s <- p:(N+1)
      aux <- Ab[imax, s]          # výměna řádků kvůli stabilitě výpočtu
      Ab[imax, s] <- Ab[p, s]
      Ab[p, s] <- aux
    }
    u <- - 1/Ab[p, p]             # normalizační faktor
    for(r in (p+1):N){
      s <- (p+1):(N+1)
      Ab[r, s] <- Ab[r, s] + Ab[r, p] * u * Ab[p, s]  
      # eliminace prvků pod diagonálou
    }
  }
  # zpětný chod (dosazování zpět)
  x <- b
  x[N] <- Ab[N, N+1]/Ab[N, N]     # poslední neznámá
  for(r in (N-1):1){
    s <- (r+1):N
    x[r] <- (Ab[r, N+1] - sum(Ab[r, s] * x[s]))/Ab[r, r]  
    # postupné dopočítání ostatních neznámých
  }
  return(x)                       # výsledný vektor řešení x
}



# typ funkce, kterou chci prokládat
Phi <- function(x){ # báze - pro případ polynomu n-tého stupně
  n <- 50                       # počet bázových funkcí (stupeň polynomu)
  res <- numeric(n)              # inicializace vektoru výsledků
  res[1] <- 1                    # první prvek (x^0 = 1)
  for(i in 2:n) res[i] <- res[i-1]*x  # postupně vytváří mocniny x
  return(res)                    # vrací vektor [1, x, x^2, ..., x^(n-1)]
}

Lorenz <- function(x, a, beta){
  n <- length(x)
  res <- numeric(n)
  res[1] <- 0
  for(i in 2:n) res[i] <- x^a*beta^(x-1) 
}

# hlavní funkce metody nejmenších čtverců
MNC <- function(x,y,Phi){
  A <- sapply(x, Phi)   
  # vytvoření matice A: každý sloupec = Phi(x_i)
  print(A)
  return(GaussEliminationPivoting(A%*%t(A), A%*%y)) 
}

MNCL <- function(x,y,Lorenz, alpha, beta){
  A <- sapply(x, Lorenz, alpha, beta)   
  # vytvoření matice A: každý sloupec = Phi(x_i)
  print(A)
  return(GaussEliminationPivoting(A%*%t(A), A%*%y)) 
}

# model Lorenzovy křivky
#y <- p^a*beta^(p-1)

a1 <- MNCL(a, beta, Phi) 
# Vykreslení výsledné aproximace  
plot(p, L)
lines(p, p^a*beta^(p-1))
print(sapply(p, function(p) sum(a1*Lorenz(p, a, beta))))
lines(p, sapply(p, function(p) sum(a1*Lorenz(p, a, beta))), col="red")  # vykreslení proložené křivky pomocí součinu koeficientů a bázových funkcí
  
# Giniho koeficient
#G <- 1-2*integruj(L)

