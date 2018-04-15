# R (My solution)

euler_1 <- function(y){
  x <- 1:(y)
  three <- x[x%%3 == 0]
  five <- x[x%%5 == 0]
  
  sum(unique(c(three, five)))
}

euler_1(999)

microbenchmark::microbenchmark(euler_1(999))

# Unit: microseconds
# expr    min     lq     mean median      uq      max neval
# euler_1(1000) 52.751 53.371 104.9235 53.597 53.9785 4917.384   100

# R (PE solution)

euler_1pe <- function(y){
  
  sum_divisible_by <- function(n){
    p = floor(y / n)
    n *( (p * (p + 1)) / 2)
  }
  
  sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)
}

euler_1pe(999)

microbenchmark::microbenchmark(euler_1pe(999))

# Unit: microseconds
# expr   min    lq     mean median     uq      max neval
# euler_1pe(999) 1.326 1.364 48.67212 1.4155 1.4485 4725.891   100

# C++

includesrc<- '
euler1(const int n){
int y = 999;
int sum = 0;

int p = 0;

p = y/n;

sum = n * (p * (p + 1)) / 2;

std::cout << sum;
return sum;
}'


CppBody <- '
int x = Rcpp::as<int>(xs);
return Rcpp::wrap( euler1(x) );'


euler_1cpp <- inline::cxxfunction(sig = signature(xs = "int"),
                                  plugin = "Rcpp",
                                  incl = includesrc,
                                  body = CppBody)
