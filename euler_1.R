# R (My solution)

euler_1 <- function(y){
  x <- 1:(y)
  three <- x[x%%3 == 0]
  five <- x[x%%5 == 0]
  
  sum(unique(c(three, five)))
}

euler_1(999)

# R (PE solution)

euler_1pe <- function(y){
  
  sum_divisible_by <- function(n){
    p = floor(y / n)
    n *( (p * (p + 1)) / 2)
  }
  
  sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)
}

euler_1pe(999)

# C++
Rcpp::sourceCpp("euler_1.cpp")
euler1Cpp()

# Save results
library(tidyverse)
library(microbenchmark)

results <- microbenchmark(`1-r-Mine` = euler_1(999),
               `1-r-PE` = euler_1pe(999),
               `1-Cpp-PE` = euler1Cpp(), 
               times = 1000,
               unit = "us") 

data <- data_frame(problem = results$expr, time = results$time) %>%
  separate(problem, into = c("problem", "lang", "code"), sep = "-")

read_rds("data.rds") %>%
  filter(!problem %in% data$problem[1]) %>% 
  full_join(data) %>% write_rds("data.rds")
