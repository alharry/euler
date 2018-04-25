# R (My solution)

euler_5 <- function(){
max_n <- 20
x <- 1:max_n

# Primes
increment <- prod(c(2, 3, 5, 7, 11, 13, 17, 19))
smallest <- increment

run = TRUE
i = 1
while(run == TRUE){
    if(smallest %% x[i] == 0){
      i = i + 1
      if(i == max_n){run = FALSE}
      }else{
    smallest = smallest + increment
    i = 1}
  }
return(smallest)}

# R (PE solution)

euler_5pe <-function(){

  k = 20
  N = 1
  p <- c(2, 3, 5, 7, 11, 13, 17, 19)
  a <- rep(1, length(p))
  check = TRUE
  limit = sqrt(k)

  for(i in 1:length(p)){ 
    a[i] = 1
    if(check){ 
      if (p[i] <= limit){
        a[i] = floor(log(k)/log(p[i]))}
    }else{
    check = FALSE
    }

N = N * p[i] ^ a[i]
i = i + 1
}
return(N)
}

euler_5pe()

# C++
Rcpp::sourceCpp("euler_5.cpp")
euler5Cpp()

# Save results
library(tidyverse)
library(microbenchmark)

results <- microbenchmark(`5-r-Mine` = euler_5(),
                          `5-r-PE` = euler_5pe(),
                          `5-Cpp-PE` = euler5Cpp(),
                          times = 1000,
                          unit = "us")

data <- data_frame(problem = results$expr, time = results$time) %>%
  separate(problem, into = c("problem", "lang", "code"), sep = "-")


read_rds("data.rds") %>%
  filter(!problem %in% data$problem[1]) %>% 
  full_join(data) %>% write_rds("data.rds")
