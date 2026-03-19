library(expm)
n <- 4
P <-matrix(runif(n*n), n, n)
# for(i in 1:4) P[i, ] <- P[i, ]/sum(P[i, ])
P <- P / rowSums(P)
View(P)

View(P%^%20)


P <- matrix(0, 6, 6)
diag(P[-1, ]) <- 0.5
diag(P[, -1]) <- 0.5
P[1,1] <- P[6,6] <- 1
P[1,2] <- P[6,5] <- 0
View(P)
View(P%^%100)



n <- 1000000
stavy <- numeric(6)
for(i in 1:n){
  stav <- 2
  repeat{
    p <- runif(1)
    if(p < 0.5) stav <- stav - 1
    else stav <- stav + 1
    stavy[stav] <- stavy[stav] + 1
    if(stav == 1 || stav == 6) break
  }
}
print(stavy/n)