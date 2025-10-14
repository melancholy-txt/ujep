Horner <- function(a, x){
  n <- length(a)
  res <- 0
  for(i in n:1){
    res <- res*x + a[i]
  }
  return(res)
}

NewtonHorner <- function(a, x){
  n <- length(a)
  for(j in 1:1000000){
    y <- 0
    yd <- 0
    for(i in n:2){
      y <- y*x + a[i]
      yd <- yd*x + y
    }
    y <- y*x + a[i]
    x <- x-y/yd
  }
  return(x)
}

a <- c(-7, -5, 3) # 3x^2 - 5x + 11

x <- seq(-3, 3, 0.0001)
plot(x, Horner(a, x), col = "blue", type = "l")
abline(h = 0, col = "gray")
xroot <- NewtonHorner(a, -2)
points(xroot, 0, col = "red")
xroot <- NewtonHorner(a, 2)
points(xroot, 0, col = "red")
