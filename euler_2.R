# R (My solution)

euler_2 <- function(x){
  yy <- c(1, 2)
  total <- sum(yy)
  
  while(total <= x){
    yy[length(yy)+1] <- sum(yy[c(length(yy), length(yy)-1)])
    
    total <- max(yy)
      
  }
  
  yy <- yy[-which(yy > x)]
  
  ans = sum(yy[yy %% 2 == 0])
  
  return(ans)
}

euler_2(4e6)

microbenchmark::microbenchmark(euler_2(4e6))

# Unit: microseconds
# expr    min     lq     mean  median     uq     max neval
# euler_2(4e+06) 87.579 91.685 94.51014 93.5655 95.106 160.106   100


# R (Project Euler solution)

euler_2pe <- function(limit){
  sum = 0
  a = 1
  b = 1
  c = a + b
  while(c < limit){
    sum = sum + c
    a = b + c
    b = c + a
    c = a + b
  }
  return(sum)
}

euler_2pe(4e6)

microbenchmark::microbenchmark(euler_2pe(4e6))

# Unit: microseconds
# expr    min     lq     mean median      uq     max neval
# euler_2pe(4e+06) 15.052 16.079 21.20379 17.105 22.5785 148.474   100

# C++
Rcpp::sourceCpp("euler_2.cpp")
euler2Cpp(4e6)

microbenchmark::microbenchmark(euler2Cpp(4e6))

# Unit: microseconds
# expr   min    lq    mean median     uq    max neval
# euler2Cpp(4e+06) 2.394 3.079 8.33034 4.2765 12.145 40.711   100
