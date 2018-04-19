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

# C++
Rcpp::sourceCpp("euler_2.cpp")
euler2Cpp(4e6)

# Save results
library(tidyverse)
library(microbenchmark)

results <- microbenchmark(`2-r-Mine` = euler_2(4e6L),
                          `2-r-PE` = euler_2pe(4e6L),
                          `2-Cpp-PE` = euler2Cpp(4e6L), 
                          times = 1000,
                          unit = "us") 

data <- data_frame(problem = results$expr, time = results$time) %>%
  separate(problem, into = c("problem", "lang", "code"), sep = "-")


read_rds("data.rds") %>%
  filter(!problem %in% data$problem[1]) %>% 
  full_join(data) %>% write_rds("data.rds")

