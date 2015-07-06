## quick and dirty solution to ProjectEuler's Amicable Numbers
## problem 21
## author: gianna fusaro

# Let d(n) be defined as the sum of proper divisors of n (numbers less than
# n which divide evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then
# a and b are an amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
# 71 and 142; so d(284) = 220. Evaluate the sum of all the amicable numbers
# under 10000.

# calculates sum of divisor list for n
def calc_divisor_sum(n):
    divisors = []
    for i in range(1, n):
        # add all proper divisors to n's divisors list
        if(n%i == 0):
            divisors.append(i)
    return sum(divisors)

# returns sum of all amicable numbers less than n
def get_amicable(n):
    amicable = set()
    # at index i, store sum of proper divisors of i
    divisor_sums = [(calc_divisor_sum(i)) for i in range(n+1)]
    for i in range(1, (n+1)):
        if divisor_sums[i]<(n+2):
            # if two numbers are amicable, store in set
            if (i==divisor_sums[divisor_sums[i]]) & (i!=divisor_sums[i]):
                amicable = amicable.union(set([i, divisor_sums[i]]))
    return sum(amicable)

print("Sum of all amicable numbers less than 10000: ", get_amicable(10000))
