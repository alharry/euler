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

# R (Project Euler solution)

euler_7pe <- function(LIMIT){
  
isPrime <- function(n){  
  if(n == 1) {out = FALSE} else {
    if(n < 4) {out = TRUE} else {
      if(n %% 2 == 0) {out = FALSE} else {
        if(n < 9) {out = TRUE} else{
          if(n %% 3 == 0) {out = FALSE} else {
            r = floor(sqrt(n))
            f = 5
            while(f <= r){
              if(n %% f == 0){
                out = FALSE
                break()} else
                  if(n %% (f+2) == 0) {
                    out = FALSE
                    break()
                  }
              f = f + 6
              out = TRUE
            }
          }
        }
      }
    }
  }
  
  return(out)
}

limit = LIMIT
count = 1 
candidate = 1

repeat{candidate = candidate+2
if(isPrime(candidate)){count = count + 1}
if(count == limit){break()}
}
return(candidate)
}
      