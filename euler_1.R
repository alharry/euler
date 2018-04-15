# R (My solution)

euler_1 <- function(y){
  x <- 1:(y-1)
  three <- x[x%%3 == 0]
  five <- x[x%%5 == 0]
  
  sum(unique(c(three, five)))
}

euler_1(1000)


microbenchmark::microbenchmark(euler_1(1000))

# Unit: microseconds
# expr    min     lq     mean median      uq      max neval
# euler_1(1000) 52.751 53.371 104.9235 53.597 53.9785 4917.384   100

# R (PE solution)

euler_1pe <- function(y){
  
  sum_divisible_by <- function(n){
    p = floor(y / n)
    n *( (p * (p + 1)) / 2)
  }
  
  sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)
}

euler_1pe(999)

microbenchmark::microbenchmark(euler_1pe(999))

# Unit: microseconds
# expr   min    lq     mean median     uq      max neval
# euler_1pe(999) 1.326 1.364 48.67212 1.4155 1.4485 4725.891   100
