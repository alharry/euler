#include <Rcpp.h> 
using namespace Rcpp;

// [[Rcpp::export]]
int euler2Cpp(int limit) {
  int sum = 0, a = 1, b = 1;
  int c = a + b;
  
  while(c < limit) {
    sum = sum + c;
    a = b + c;
    b = c + a;
    c = a + b;
  }
  
  std::cout << sum;
  return 0;
}