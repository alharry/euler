euler_2 <- function(x){
  
  # Starting values
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

euler_2(4e-6)

microbenchmark::microbenchmark(euler_2(4e-6))

# Unit: microseconds
# expr   min    lq    mean median    uq    max neval
# euler_2(4e-06) 3.763 4.105 5.15908  4.447 4.789 37.974   100

