# R (My solution)

euler_6 <- function(x){
  sum_sq <- sum((1:x)^2)
  sq_sum <- sum(1:x)^2
  
  return(sq_sum - sum_sq)
}

# R (PE solution)

euler_6pe <- function(x){
  
  sq_sum = (x * (x + 1)/2)^2
  sum_sq = (2 * x + 1) * (x + 1) * x /6

  return(sq_sum - sum_sq)  
}

# C++ (PE solution)
Rcpp::sourceCpp("euler_6.cpp")
euler6Cpp(100)

# Save results
library(tidyverse)
library(microbenchmark)

results <- microbenchmark(`6-r-Mine` = euler_6(100),
                          `6-r-PE` = euler_6pe(100),
                          `6-Cpp-PE` = euler6Cpp(100),
                          times = 1000,
                          unit = "us")

data <- data_frame(problem = results$expr, time = results$time) %>%
  separate(problem, into = c("problem", "lang", "code"), sep = "-")


read_rds("data.rds") %>%
  filter(!problem %in% data$problem[1]) %>% 
  full_join(data) %>% write_rds("data.rds")
