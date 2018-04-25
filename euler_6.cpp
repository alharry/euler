#include <Rcpp.h> 
using namespace Rcpp;

// [[Rcpp::export]]
int euler6Cpp(int x){
  
  int sq_sum = pow(x * (x + 1)/2, 2);
  int sum_sq = (2 * x + 1) * (x + 1) * x /6;
  
  return(sq_sum - sum_sq);
}