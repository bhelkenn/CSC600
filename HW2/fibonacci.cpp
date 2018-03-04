#include <iostream>
#include <time.h>

using namespace std;

unsigned long int Frec(unsigned long int);
unsigned long int Fit(int);
double sec(void);

int main() {
  int N10 = 0;
  double timer = 0.0;
  while (timer < 10.0) {
    Frec(N10);
    timer = sec() - timer;
    if (timer < 10.0) N10++;
  }
  
  cout << "N10: " << N10 << endl;
  clock_t start_timer = clock()/CLOCKS_PER_SEC;
  Frec((unsigned long int)N10);
  timer = sec() - (double)start_timer;
  cout << "Recursion took " << timer << " sec" << endl;
  double recursion_timer = timer;
  start_timer = clock()/CLOCKS_PER_SEC;
  Fit(N10);
  timer = sec() - (double)start_timer;
  cout << "Iteration took " << timer << " sec" << endl;
  double iteration_timer = timer;

  cout << "Iteration is " << recursion_timer / iteration_timer
      << " times faster than recursion." << endl;
  return 0;
}

unsigned long int Frec(unsigned long int n) {
  if (n < 2)
    return n;
  else
    return Frec(n - 1) + Frec(n - 2);
}

unsigned long int Fit(int n) {
  unsigned long int first, second, result;
  first = 0;
  second = 1;
  result = n;

  if (n < 2)
    return result;
  else {
    for (int i = 2; i <= n; i++) {
      result = first + second;
      first = second;
      second = result;
    }
  }

  return result;
}

double sec(void) {
  return double(clock()) / double(CLOCKS_PER_SEC);
}
