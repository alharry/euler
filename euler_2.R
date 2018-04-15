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
# expr    min      lq     mean  median    uq    max neval
# euler_2(4e+06) 39.563 42.7575 45.96144 43.9625 46.68 88.046   100


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
# expr   min    lq    mean median    uq   max neval
# euler_2pe(4e+06) 1.492 1.509 1.64328 1.5265 1.601 7.639   100

# C++
Rcpp::sourceCpp("euler_2.cpp")
euler2Cpp(4e6)

microbenchmark::microbenchmark(euler2Cpp(4e6))

# Unit: microseconds
# expr   min     lq     mean median    uq     max neval
# euler2Cpp(4e+06) 3.214 3.3935 13.16773  3.614 5.218 885.347   100
