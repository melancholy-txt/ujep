library(expm)
n <- 4
P <- matrix(runif(n*n), n, n)
for(i in 1:n) {
  P[i,] <- P[i,] / sum(P[i,])
}
View(P)
# P matrix to the times of x
View(P %^% 20)

# opilec

P <- matrix(0, 6, 6)
diag(P[-1, ]) <- 0.5
diag(P[, -1]) <- 0.5
P[1, 1] <- P[6,6] <- 1
P[1, 2] <- P[6, 5] <- 0
  
View(P)
View(P %^% 20)

# simulace
n <- 1000
states <- 1:6
for(i in 1:n) {
  state <- 2
  repeat{
    p <- runif(1)
    if (p < 0.5) state <- state - 1
    else state <- state + 1
    states[state] <- states[state] + 1
    if (state == 1 || state == 6) break
    
  }
}