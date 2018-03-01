#include <iostream>

using namespace std;
void reduce(int*, int&);
void PrintArray(int*, int);

int main() {
  int size = 16;
  int array[] = {9,1,1,6,7,1,2,3,3,5,6,6,6,6,7,9};
  PrintArray(array, size);
  reduce(array, size);
  PrintArray(array, size);

  return 0;
}

void reduce(int *array, int &size) {
  int max, mid, min;
  max = mid = min = 0;

  for (int i = 0; i < size; i++) {
    if (array[i] > max) {
      min = mid;
      mid = max;
      max = array[i];
    } else if (array[i] > mid && array[i] < max) {
      min = mid;
      mid = array[i];
    } else if (array[i] > min && array[i] < mid) {
      min = array[i];
    }
  }

  int original_size = size;
  for (int i = 0; i < original_size; i++) {
    if (array[i] >= min) size--;
  }

  int *reducedArray = new int[size];
  int reduced_index = 0;

  for (int i = 0; i < original_size; i++) {
    if (array[i] < min) {
      reducedArray[reduced_index] = array[i];
      reduced_index++;
    }
  }

  for (int i = 0; i < size; i++) {
    array[i] = reducedArray[i];
  }
}

void PrintArray(int *array, int size) {
  for (int i = 0; i < size; i++) {
    cout << array[i] << " ";
  }
  cout << endl;
}
