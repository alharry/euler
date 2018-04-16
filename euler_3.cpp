#include <Rcpp.h> 
using namespace Rcpp;

// [[Rcpp::export]]
int euler3Cpp(int N) {
  
  int n = N;
  
  if(n % 2 == 0){
    int last_factor = 2;
    n = n / 2
    while(n %% 2 == 0){
      n = n / 2
    }
  } else {
    last_factor = 1
  }
  
  factor = 3
  max_factor = sqrt(n)
    
    while(n > 1 & factor < max_factor){
      if(n %% factor == 0){
        n = n / factor
        last_factor = factor
        while(n %% factor == 0){
          n = n / factor
        }
        max_factor = sqrt(n)
      }
      factor = factor + 2
    }
    if(n == 1){
      return(last_factor)}
    else{return(n)}
    
}
}