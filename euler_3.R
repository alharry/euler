
x = 3
end <- 600851475143
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

  # First test: is x a factor of `end`?
  if (end %% x == 0) {
    # Yes. Second test: is x a prime?
    # Fermats little theorem
    if (prime_check(x) == TRUE) {
      # Yes. Keep it and divide end by x
      end <- end / x
      maxprime <- x
      print(maxprime)
      # Third test: is end equal to one
      # Yes. Stop algorithm
      if (end == 1) {
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



