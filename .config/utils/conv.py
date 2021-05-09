#!/bin/env python
# Convert number from ibase to obase

import sys

# Constants
DIGITS_TO_HEX = ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F")
DIGITS_FROM_HEX = {"0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9,
                   "A": 10, "B": 11, "C": 12, "D": 13, "E": 14, "F": 15}


def validate_inputs():
    if len(sys.argv) != 4:
        print("Invalid Number of Arguments: Enter number base_in base_out")
        return False

    if (int(sys.argv[2]) > 16) or (int(sys.argv[3]) > 16):
        print("Conversion bases may not exceed 16")
        return False

    if sys.argv[2] == sys.argv[3]:
        print("Enter different from_base and to_base")
        return False

    return True


def to_base_10(n_str, base):
    digits = n_str.upper()
    n = 0

    for i in range(len(digits)):
        d = digits[i]
        n = n * base + DIGITS_FROM_HEX[d]

    return str(n)


def from_base_10(quotient, to_base):
    digits_out = ""

    while quotient > 0:
        remainder = quotient % to_base
        quotient = quotient // to_base
        digits_out = DIGITS_TO_HEX[remainder] + digits_out

    return digits_out


def main():
    if not(validate_inputs()):
        sys.exit(1)

    n = sys.argv[1]
    ibase = int(sys.argv[2])
    obase = int(sys.argv[3])

    if ibase == 10:
        n_out = from_base_10(int(n), obase)

    if obase == 10:
        n_out = to_base_10(n, ibase)

    if ibase != 10 and obase != 10:
        n_b10 = to_base_10(n, ibase)
        n_out = from_base_10(int(n_b10), obase)

    print(f"{n} [{ibase}] -> {n_out} [{obase}]")

    return


if __name__ == '__main__':
    main()
