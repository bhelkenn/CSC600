#include <iostream>
using namespace std;

const int DISPLAY_SIZE = 7;
void BigInt(int);

int main() {
	
	return 0;
}

void BigInt(int n) {
	char e = ' ';
	char f = '@';
	char block1[DISPLAY_SIZE][DISPLAY_SIZE] = {e, e, e, f, f, e, e, 
																						 e, e, f, f, f, e, e, 
																						 e, e, e, f, f, e, e,
																						 e, e, e, f, f, e, e,
																						 e, e, e, f, f, e, e,
																						 e, e, e, f, f, e, e,
																						 e, e, f, f, f, f, e}
	char block2[DISPLAY_SIZE][DISPLAY_SIZE] = {e, f, f, f, f, f, e, 
																						 f, f, e, e, e, f, f,
																						 e, e, e, e, e, f, f,
																						 e, e, e, e, f, e, e,
																						 e, e, f, f, e, e, e,
																						 f, f, e, e, e, f, f,
																						 f, f, f, f, f, f, f}
	char block3[DISPLAY_SIZE][DISPLAY_SIZE] = {e, f, f, f, f, f, e, 
																						 f, f, e, e, e, f, f,
																						 e, e, e, e, e, f, f,
																						 e, e, e, f, f, f, e,
																						 e, e, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e}
	char block4[DISPLAY_SIZE][DISPLAY_SIZE] = {e, e, e, e, f, f, e, 
																						 e, e, e, f, f, f, e,
																						 e, e, f, e, f, f, e,
																						 e, f, e, e, f, f, e,
																						 f, f, f, f, f, f, f,
																						 e, e, e, e, f, f, e,
																						 e, e, e, e, f, f, e}
	char block5[DISPLAY_SIZE][DISPLAY_SIZE] = {f, f, f, f, f, f, f, 
																						 f, f, e, e, e, e, e,
																						 f, f, f, f, f, f, e,
																						 f, f, e, e, e, f, f,
																						 e, e, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e}
	char block6[DISPLAY_SIZE][DISPLAY_SIZE] = {e, f, f, f, f, f, e, 
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, e, e,
																						 f, f, f, f, f, e, e,
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e}
	char block7[DISPLAY_SIZE][DISPLAY_SIZE] = {f, f, f, f, f, f, f, 
																						 e, e, e, e, e, f, f,
																						 e, e, e, e, f, f, e,
																						 e, e, e, f, f, e, e,
																						 e, e, f, f, e, e, e,
																						 e, f, f, e, e, e, e,
																						 f, f, e, e, e, e, e}
	char block8[DISPLAY_SIZE][DISPLAY_SIZE] = {e, f, f, f, f, f, e, 
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e,
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e}
	char block9[DISPLAY_SIZE][DISPLAY_SIZE] = {e, f, f, f, f, f, e, 
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, f,
																						 e, e, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e}
	char block0[DISPLAY_SIZE][DISPLAY_SIZE] = {e, f, f, f, f, f, e, 
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 f, f, e, e, e, f, f,
																						 e, f, f, f, f, f, e}
	
	int digit_storage[10];
	int number_of_digits = 0;
	
	while (n > 0) {
		digit_storage[number_of_digits] = n % 10;
		number_of_digits++;
		n /= 10;
	}
	
	char display_block[(DISPLAY_SIZE + 1) * number_of_digits][DISPLAY_SIZE];
}