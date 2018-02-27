#include <iostream>
using namespace std;

const int DISPLAY_SIZE = 7;
void BigInt(int);
void copyBlock(char*, int, int);
void addEmptyColumn(char*, int);

int main() {
	BigInt(3);
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
	cout << "number_of_digits: " << number_of_digits << endl;

	for (int i = number_of_digits - 1; i >= 0; i--) {
		digits[i] = n % 10;
		n /= 10;
	}
	for (int i = 0; i < number_of_digits; i++) {
		cout << "digits[" << i << "]: " << digits[i] << endl;
	}
	int rows = DISPLAY_SIZE;
	int columns = (DISPLAY_SIZE + 1) * number_of_digits;
	char display_block[rows * columns];

	for (int i = 0; i < number_of_digits; i++) {
		copyBlock(display_block, digits[i], i);
		addEmptyColumn(display_block, (i + 1) * DISPLAY_SIZE + 1);
	}

	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < columns; j++) {
			cout << display_block[j + i * columns];
		}
		cout << endl;
	}
}

void copyBlock(char *display_block, int digit, int placement) {
	char e = ' ';
	char f = '@';
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

	switch (digit) {
	case 1:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block1[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 2:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block2[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 3:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block3[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 4:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block4[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 5:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block5[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 6:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block6[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 7:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block7[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 8:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block8[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 9:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block9[j + i * DISPLAY_SIZE];
			}
		}
		break;
	case 0:
		for (int i = 0; i < DISPLAY_SIZE; i++) {
			for (int j = 0; j < DISPLAY_SIZE; j++) {
				display_block[(i + placement) * DISPLAY_SIZE + j] = block0[j + i * DISPLAY_SIZE];
			}
		}
		break;
	default:
		break;
 	}
}

void addEmptyColumn(char *display_block, int column) {
	for (int i = 0; i < DISPLAY_SIZE; i++) {
		display_block[column + i * DISPLAY_SIZE] = ' ';
	}
}
