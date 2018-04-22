#include <Rcpp.h> 
using namespace Rcpp;

// [[Rcpp::export]]
int euler5Cpp(){
  double k = 20;
  int N = 1;
  NumericVector p =
    NumericVector::create(2.0, 3.0, 5.0, 7.0, 11.0, 13.0, 17.0, 19.0);
  NumericVector a(p.size(), 1);
  bool check = TRUE;
  double limit = pow(k, 0.5);
  
  for(int i = 0; i < p.size(); i++){ 
    a[i] = 1;
    if(check == TRUE){ 
      if (p[i] <= limit){
        a[i] = floor(log(k)/log(p[i])); 
        }
    }else{
      check = FALSE;
    }
    
    N = N * pow(p[i], a[i]);
  }
  return(N);
}