# R (My solution)

x <- 10:20

y <- x %*% t(x)

y1 <- y/10

y2 <- abs((y/100 - round(y/100)) * 100)

y3 <- round(abs((y2/10 - round(y2/10)) *10))
