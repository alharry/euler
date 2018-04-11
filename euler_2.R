# R (My solution)

euler_2 <- function(x){
  
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

euler_2pe(4e-6)

microbenchmark::microbenchmark(euler_2pe(4e-6))

# Unit: microseconds
# expr  min    lq    mean median    uq    max neval
# euler_2pe(4e-06) 1.71 1.711 2.69604  1.711 2.053 55.423   100


# C++

includesrc<- '
euler2(const int limit){
  int sum = 0;
  int a = 1;
  int b = 1;
  int c = a + b;
      
    while(c < limit) {
      sum = sum + c;
      a = b + c;
      b = c + a;
      c = a + b;
    }

  std::cout << sum;
  return 0;
  }'

CppBody <- '
int x = Rcpp::as<int>(xs);
return Rcpp::wrap( euler2(x) );'


euler_2cpp <- inline::cxxfunction(sig = signature(xs = "int"),
                               plugin = "Rcpp",
                               incl = includesrc,
                               body = CppBody)

microbenchmark::microbenchmark(euler_2cpp(4e-6))

# Unit: microseconds
# expr   min     lq   mean median     uq   max neval
# euler_2cpp(4e-06) 1.368 1.7105 5.3406 1.8815 4.7895 74.24   100