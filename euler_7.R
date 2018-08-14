# R (My solution)

euler_7 <- function(max_prime){
  
prime_check <- function(x){
    prime = TRUE
    ints <- 2:(x-1)
    ints = ints[ints %% 5 == 1]
    for(i in 1:length(ints)) {
      if ((x %% ints[i]) == 0) {
        prime = FALSE
        break
      }
    }
    return(prime)
  }
  
run = TRUE  
j = 3
x = 7

while(run == TRUE){
  
  if(prime_check(x) == TRUE){
    j = j + 1
  }
  
  if(j == max_prime){
    run = FALSE

  } else {
    x = x + 2
  }
  
}

return(list(j = j, x = x))
}

euler_7(10001)
