#include <iostream>
using namespace std;

const int DISPLAY_SIZE = 7;
void BigInt(int);
void AddEmptyColumn(char*, int, int);
void CopyBlock(char*, int, int, int);
void PrintBlock(char*, int);

int main() {
	int value = 0;
	BigInt(1);
	BigInt(12);
	BigInt(123);
	BigInt(1234);
	BigInt(12345);
	BigInt(123456);
	BigInt(1234567);
	BigInt(12345678);
	BigInt(123456789);
	BigInt(1234567890);

	return 0;
}

void BigInt(int n) {
	int digits[10];
	int number_of_digits = 0;
	int tmp = n;

	while (tmp > 0) {
		number_of_digits++;
		tmp /= 10;
	}

	for (int i = number_of_digits - 1; i >= 0; i--) {
		digits[i] = n % 10;
		n /= 10;
	}

	int rows = DISPLAY_SIZE;
	int columns = (1 + DISPLAY_SIZE) * number_of_digits;

	char *display_block = new char[rows * columns];

	for (int i = 0; i < number_of_digits; i++) {
		int starting_col = i + DISPLAY_SIZE * i;
		CopyBlock(display_block, digits[i], starting_col, columns);
		AddEmptyColumn(display_block, starting_col + DISPLAY_SIZE, columns);
	}

	PrintBlock(display_block, columns);
}

void CopyBlock(char *display_block, int digit, int starting_col, int target_col_count) {
	char e = ' ';
	char f = '@';
	char* big_digits[10];
	for (int i = 0; i < 10; i++) {
		big_digits[i] = new char[DISPLAY_SIZE * DISPLAY_SIZE];
	}
	char block1[DISPLAY_SIZE * DISPLAY_SIZE] = {e, e, e, f, f, e, e,
																							e, e, f, f, f, e, e,
																							e, e, e, f, f, e, e,
																							e, e, e, f, f, e, e,
																							e, e, e, f, f, e, e,
																							e, e, e, f, f, e, e,
																							e, e, f, f, f, f, e};
	char block2[DISPLAY_SIZE * DISPLAY_SIZE] = {e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							e, e, e, e, e, f, f,
																							e, e, e, e, f, e, e,
																							e, e, f, f, e, e, e,
																						 	f, f, e, e, e, f, f,
																							f, f, f, f, f, f, f};
	char block3[DISPLAY_SIZE * DISPLAY_SIZE] = {e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							e, e, e, e, e, f, f,
																							e, e, e, f, f, f, e,
																							e, e, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e};
	char block4[DISPLAY_SIZE * DISPLAY_SIZE] = {e, e, e, e, f, f, e,
																							e, e, e, f, f, f, e,
																							e, e, f, e, f, f, e,
																							e, f, e, e, f, f, e,
																							f, f, f, f, f, f, f,
																							e, e, e, e, f, f, e,
																							e, e, e, e, f, f, e};
	char block5[DISPLAY_SIZE * DISPLAY_SIZE] = {f, f, f, f, f, f, f,
																							f, f, e, e, e, e, e,
																							f, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							e, e, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e};
	char block6[DISPLAY_SIZE * DISPLAY_SIZE] = {e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, e, e,
																							f, f, f, f, f, e, e,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e};
	char block7[DISPLAY_SIZE * DISPLAY_SIZE] = {f, f, f, f, f, f, f,
																							e, e, e, e, e, f, f,
																							e, e, e, e, f, f, e,
																							e, e, e, f, f, e, e,
																							e, e, f, f, e, e, e,
																							e, f, f, e, e, e, e,
																							f, f, e, e, e, e, e};
	char block8[DISPLAY_SIZE * DISPLAY_SIZE] = {e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e};
	char block9[DISPLAY_SIZE * DISPLAY_SIZE] = {e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, f,
																							e, e, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e};
	char block0[DISPLAY_SIZE * DISPLAY_SIZE] = {e, f, f, f, f, f, e,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							f, f, e, e, e, f, f,
																							e, f, f, f, f, f, e};
	big_digits[0] = block0;
	big_digits[1] = block1;
	big_digits[2] = block2;
	big_digits[3] = block3;
	big_digits[4] = block4;
	big_digits[5] = block5;
	big_digits[6] = block6;
	big_digits[7] = block7;
	big_digits[8] = block8;
	big_digits[9] = block9;

	for (int i = 0; i < DISPLAY_SIZE; i++) {
		for (int j = 0; j < DISPLAY_SIZE; j++) {
			int target_row, target_col;
			target_row = i;
			target_col = j + starting_col;

			display_block[target_col + target_col_count * target_row] = big_digits[digit][j + DISPLAY_SIZE * i];
		}
	}
}

void AddEmptyColumn(char *display_block, int starting_col, int columns) {
	for (int i = 0; i < DISPLAY_SIZE; i++) {
		display_block[starting_col + i * columns] = ' ';
	}
}

void PrintBlock(char *block, int columns) {
	for (int i = 0; i < DISPLAY_SIZE; i++) {
		for (int j = 0; j < columns; j++) {
			cout << block[j + columns * i];
		}
		cout << endl;
	}
}
