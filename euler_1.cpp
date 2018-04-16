#include <Rcpp.h> 
using namespace Rcpp;

// [[Rcpp::export]]

int sum_divisibleCpp(int n){
  int y = 999;
  int p = floor(y / n);
  
  return(n *( (p * (p + 1)) / 2));
}


// [[Rcpp::export]]
int euler1Cpp(){

  int sum = sum_divisibleCpp(5) + sum_divisibleCpp(3) - sum_divisibleCpp(15);

  return(sum);  
}
