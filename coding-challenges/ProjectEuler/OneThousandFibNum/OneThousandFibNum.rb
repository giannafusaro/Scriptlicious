# author: gianna fusaro

# solution to problem 25 from project euler
# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
# What is the index of the first term in the Fibonacci sequence to contain
# 1000 digits?

# helper function, returns number of digits in a given number
def many_digits(num)
  num.to_s.length
end
# fibinocci method, returns index of first fib number with 1000 digits
def fib_one_thousand(prev_index, n_minus_one, n_minus_two)
  sum = n_minus_one + n_minus_two
  many_digits(sum) == 1000 ? prev_index+1 : fib_one_thousand(prev_index+1, n_minus_two, sum)
end

result = fib_one_thousand(12, 89, 144)
puts result
