library(expm)

n <- 5
P <- matrix(runif(n*n), n, n)
P <- P /rowSums(P)
J <- rep(1, n)
print(P%*%J)

