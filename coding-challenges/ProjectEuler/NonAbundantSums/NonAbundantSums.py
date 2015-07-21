# author: giannafusaro

# solution to number 23 from project euler
# A perfect number is a number for which the sum of its proper
# divisors is exactly equal to the number. For example, the sum of
# the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which
# means that 28 is a perfect number. A number n is called deficient
# if the sum of its proper divisors is less than n and it is called
# abundant if this sum exceeds n. As 12 is the smallest abundant number,
# 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the
# sum of two abundant numbers is 24. By mathematical analysis, it can be
# shown that all integers greater than 28123 can be written as the sum of
# two abundant numbers. However, this upper limit cannot be reduced any
# further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less than
# this limit. Find the sum of all the positive integers which cannot be
# written as the sum of two abundant numbers.

## find all abundant sums
# find all possible sums of two abundant numbers
# subtract set of abundant sums from set of all numbers 1-28123

import string;
all_numbers = set(range(1, 28124))

# calculates sum of divisor list for n
def calc_divisor_sum(n):
    divisors = []
    for i in range(1, n):
        # add all proper divisors to n's divisors list
        if(n%i == 0):
            divisors.append(i)
    return sum(divisors)

# returns if the number is abundant
def is_abundant(n):
    return (calc_divisor_sum(n) > n)

# given a list of numbers, discard all possible sums from set of numbers
# from 1 to 28124
def find_possible_sums(numbers):
    for i in range(0, len(numbers)):
        for j in range(i+1, len(numbers)):
            all_numbers.discard((numbers[i] + numbers[j]))

abundants = []
for i in range(12, 28124):
    if is_abundant(i):
        abundants.append(i)
        all_numbers.discard(i*2)

find_possible_sums(abundants)

print("sum of all numbers that are not sums of two abundant numbers: ", sum(all_numbers))
