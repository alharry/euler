euler_1 <- function(y){
  x <- 1:(y-1)
  three <- x[x%%3 == 0]
  five <- x[x%%5 == 0]
  
  sum(unique(c(three, five)))
}

euler_1(1000)


microbenchmark::microbenchmark(euler_1(1000))

# Unit: microseconds
# expr    min     lq     mean median      uq     max neval
# euler_1(1000) 55.764 66.198 78.15434  69.79 87.2375 174.132   100