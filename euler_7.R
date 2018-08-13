# R (My solution)

euler_7 <- function(){
  
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
  
run = TRUE  
j = 1
x = 3
max_prime = 10001

while(run == TRUE){
  
  if(prime_check(x) == TRUE){
    j = j + 1
  }
  
  if(j <= max_prime){
  x = x + 1
  } else {
    run = FALSE
  }
}


}