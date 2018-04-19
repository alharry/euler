# R (My solution)

euler_4 <- function(){
x <- 999:100

y <- x %*% t(x)

y_000001 <- y %% 10
y_000010 <- trunc(y/10) %% 10
y_000100 <- trunc(y/100) %% 10
y_001000 <- trunc(y/1000) %% 10
y_010000 <- trunc(y/10000) %% 10
y_100000 <- trunc(y/100000) 

max(y[y_100000 == y_000001 & y_010000 == y_000010 & y_001000 == y_000100])

}

euler_4()

# R (PE solution)
euler_4pe <- function(){

  reverse <- function(n){
    reversed = 0
    while(n > 0) {
      reversed = 10 * reversed + n %% 10
      n = trunc(n/10)
      }
    return(reversed)
    }
      
is_palindrome<- function(n){
  reverse(n) == n
  }

largest_palindrome = 0
a = 999

while (a >= 100){
  if (a %% 11 == 0){
  b = 999
  db = 1
  }else{
  b = 990 #The largest number less than or equal 999 and divisible by 11
  db = 11 
  }

  while (b >= a){
  if (a*b <= largest_palindrome){
      break}
  if (is_palindrome(a*b)){
    largest_palindrome = a*b}
  
  b = b-db
  }
  a = a-1
}


return(largest_palindrome)
}

# C++
Rcpp::sourceCpp("euler_4.cpp")
euler4Cpp()

# Save results
library(tidyverse)
library(microbenchmark)

results <- microbenchmark(`4-r-Mine` = euler_4(),
                          `4-r-PE` = euler_4pe(),
                          `4-Cpp-PE` = euler4Cpp(),
                          times = 1000,
                          unit = "us")

data <- data_frame(problem = results$expr, time = results$time) %>%
  separate(problem, into = c("problem", "lang", "code"), sep = "-")


read_rds("data.rds") %>%
  filter(!problem %in% data$problem[1]) %>% 
  full_join(data) %>% write_rds("data.rds")


