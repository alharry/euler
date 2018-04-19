#include <Rcpp.h> 
using namespace Rcpp;

// [[Rcpp::export]]
int reverse_cpp(int n){
  
  int reversed = 0;
  
  while(n > 0) {
    reversed = 10 * reversed + n % 10; 
    n = trunc(n/10);
  }
  
  return(reversed);
}


// [[Rcpp::export]]
bool is_palindrome_cpp(int n){
  return(reverse_cpp(n) == n);
}


// [[Rcpp::export]]
int euler4Cpp(){

  int largest_palindrome = 0;
  int a = 999;
  int b = 0;
  int db = 1;

  while (a >= 100){
    if (a % 11 == 0){
        b = 999;
        db = 1;
  }else{
    b = 990; 
    db = 11; 
  }
  
  while(b >= a){
    if(a*b <= largest_palindrome){
      break;
      }
    
    if (is_palindrome_cpp(a*b)){
      largest_palindrome = a*b;
      }
    
    b = b - db;
  }
  a = a - 1;
}

return(largest_palindrome);
}
