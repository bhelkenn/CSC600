#include <iostream>
#include <math.h>

using namespace std;
int bs_iterate(int*,int,int,int);
int bs_recurse(int*,int,int,int);
double sec(void);

int main() {
  unsigned int size = pow(2,26) - 1;
  int *array = new int[size];
  for (int i = 0; i < size; i++)
    array[i] = i;

  char cont;
  double time1 = 0.0;
  for (int i = 0; i < size; i++)
    if (bs_iterate(array, 0, size, i) != i) cout << "\nERROR";
  time1 = sec();
  cout << "Iteration took " << time1 << " sec" << endl;

  for (int i = 0; i < size; i++)
    if (bs_recurse(array, 0, size, i) != i) cout << "\nERROR";

  time1 = sec() - time1;
  cout << "Recursion took " << time1 << " sec" << endl;
  return 0;
}

int bs_iterate(int *array, int begin, int end, int value) {
  int mid;

  while (begin <= end) {
    mid = (begin + end) / 2; // rounds down if odd-size range
    //cout << "mid: " << mid << "\tbegin: " << begin << "\tend: " << end << endl;
    if (array[mid] == value)
      return value; // found
    else if (array[mid] > value)
      end = mid - 1;
    else if (array[mid] < value)
      begin = mid + 1;
    else
      return -2; // something went wrong - different from not found
  }

  return -1; // not found within array
}

int bs_recurse(int *array, int begin, int end, int value) {
  int mid = (begin + end) / 2; // rounds down if odd-size range
  //cout << "mid: " << mid << "\tbegin: " << begin << "\tend: " << end << endl;
  if (array[mid] == value)
    return value; // base case
  else if (array[mid] > value && begin <= mid -1)
    return bs_recurse(array, begin, mid - 1, value); // look at lower half
  else if (array[mid] < value && mid + 1 <= end)
    return bs_recurse(array, mid + 1, end, value); // look at upper half
  else
    return -1;
}

double sec(void) {
  return double(clock()) / double(CLOCKS_PER_SEC);
}
