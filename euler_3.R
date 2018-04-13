# R (My solution)

euler_3 <- function(Y){
x = 3
y <- Y
run = TRUE

prime_check <- function(x){
  prime = TRUE
  ints <- 2:(x-1)
  index = ints[ints %% 2 == 1]
  for(i in index) {
    if ((x %% i) == 0) {
      prime = FALSE
      break
    }
  }
  return(prime)
}

while (run == TRUE) {

  # First test: is x a factor of `y`?
  if (y %% x == 0) {
    # Yes. Second test: is x a prime?
    # Fermats little theorem
    if (prime_check(x) == TRUE) {
      # Yes. Keep it and divide y by x
      y <- y / x
      maxprime <- x
      print(maxprime)
      # Third test: is y equal to one
      # Yes. Stop algorithm
      if (y == 1) {
        run <- FALSE
      # No. Go to next possible integer, keep running
        } else {
        run <- TRUE
        x <- x + 2
        }
      }
    } else
    # No. Go to next possible integer, keep running
    {
      x <- x + 2
      run <- TRUE
    }
  
}

}

euler_3(600851475143)

microbenchmark::microbenchmark(euler_3(600851475143))

# Unit: milliseconds
# expr      min       lq    mean   median      uq      max neval
# euler_3(600851475143) 1.638255 1.830261 2.17057 1.975462 2.23208 5.211348   100

# R (Project Euler solution)

euler_3pe <- function(N){

n = N

if(n %% 2 == 0){
  last_factor = 2
  n = n / 2
  while(n %% 2 == 0){
    n = n / 2
  }
} else {
  last_factor = 1
}

factor = 3
max_factor = sqrt(n)

while(n > 1 & factor < max_factor){
  if(n %% factor == 0){
    n = n / factor
    last_factor = factor
    while(n %% factor == 0){
      n = n / factor
    }
    max_factor = sqrt(n)
  }
  factor = factor + 2
}
if(n == 1){
  return(last_factor)}
    else{return(n)}
}


microbenchmark::microbenchmark(euler_3pe(600851475143))

# Unit: microseconds
# expr     min      lq     mean  median       uq     max neval
# euler_3pe(600851475143) 195.432 203.909 208.1393 206.398 210.2045 237.367   100

