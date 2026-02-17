p <- c(0.1, 0.02, 0.03, 0.05, 0.07, 0.09, 0.11, 0.13, 0.14, 0.12, 0.07, 0.04, 0.02, 0.01)

# sum(sample(0:13, 14, replace = TRUE, prob = p))

n <- 1000000

tb <- Sys.time()

citac <- 0

for (i in 1:n) {
  x <- sample(0:13, 14, replace = TRUE, prob = p)
  s <- sum(x)
  if (s <= 100) {
    citac <- citac + 1
  }
}
te <- Sys.time()

cat("For: ", citac / n, te - tb, "\n")

tb <- Sys.time()
res <- sum(replicate(n, sum(sample(0:13, 14, replace = TRUE, prob = p)) <= 100)) / n
te <- Sys.time()

cat("Replicate: ",res, te - tb, "\n")

tb <- Sys.time()
res <- sum(rowSums(matrix(sample(0:13, 14*n, replace = TRUE, prob = p), nrow = n, 14)) <= 100) / n
te <- Sys.time()
cat("Matrix: ", res, te - tb, "\n")

library(doParallel)
library(foreach)

# 1. Setup (one time only)
cores <- 6
registerDoParallel(cores)

# 2. Run the loop
# .combine = '+' tells R to automatically sum the results from all cores
tb <- Sys.time()
total_successes <- foreach(i = 1:cores, .combine = '+') %dopar% {
  
  chunk_size <- n / cores
  sum(rowSums(matrix(sample(0:13, 14*chunk_size, replace=T, prob=p), nrow=chunk_size)) <= 100)
}
te <- Sys.time()
cat("Parallel:", total_successes / n, te - tb, "\n")

A <- matrix(0, 102, 115)
for(i in 1:102) {
  A[i, i:(i+13)] <- p
}
for (i in 1:102) {
  A[i, 102] <- sum(A[i, i:(i+13)])
}
# A[,102] <- rowSums(A, 102:115)
A <- A[, 1:102]
colnames(A) <- rownames(A) <- c(100:0, "Nestačí")
View(A)







