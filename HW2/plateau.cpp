#include <iostream>
using namespace std;

int maxlen(int*, int);
int main() {
	int array_length = 10;
	int array[array_length] = {1,1,1,1,5,7,8,8,8,9};
	
	cout << "Max length: " << maxlen(array, array_length) << endl;
	return 0;
}

int maxlen(int *array, int array_length) {
	int max_count = 0; // holds the count of the longest sequence thus discovered
	int sequence_count = 0; // holds the current sequence count to compare against max_count
	
	if (array_length > 0) max_count = sequence_count = 1; // sequence starts at 1 for a non-empty array
	
	if (array_length > 1) { // only perform an O(n) sweep if array is larger than 1
		for (int i = 1; i < array_length; i++) {
			if (array[i] == array[i - 1]) sequence_count++; // if same, extend the sequence by 1
			else { // different, sequence broken
				if (sequence_count > max_count) max_count = sequence_count; // if new max found, store in max_count
				sequence_count = 1; // reset sequence to 1
			}
		}
	}
	
	return max_count; // returns either 1 if array_length == 1, or other a truly meaningful max_count calculated at O(n)
}