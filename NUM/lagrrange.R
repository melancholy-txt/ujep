Lagrange <- function(xk, yk, x){
  m <- length(xk)
  L <- 0
  for(j in 1:m){
    lj <- 1 
    for(m in 1:k){
      if(m != j) lj <- (x-xk[m])/(xk[j]-xk[m])*lj
    }
    L <- L + yk[j]*lj
  }
  return(L)
}
# značení z wiki

plot(sin, xlim = c(0, 2*pi), col = "red")
xk <- runif(5, 0, 2*pi)
yk <- sin(xk)
points(xk, yk, col = "green")
x <- seq(0, 2*pi, 0.01)
lines(x, Lagrange(xk, yk, x), col = "blue")
