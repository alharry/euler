euler_1 <- function(y){
  x <- 1:(y-1)
  three <- x[x%%3 == 0]
  five <- x[x%%5 == 0]
  
  sum(unique(c(three, five)))
}

euler_1(1000)