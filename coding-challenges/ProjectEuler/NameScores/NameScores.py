# solution to Project Euler problem 22 'Name Scores'
# author: gianna fusaro

# Using names.txt (right click and 'Save Link/Target As...'), a 46K
# text file containing over five-thousand first names, begin by sorting
# it into alphabetical order. Then working out the alphabetical value
# for each name, multiply this value by its alphabetical position in
# the list to obtain a name score. For example, when the list is sorted
# into alphabetical order, COLIN, which is worth
# 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
# So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

import string
import re

# open the file, grab and put all the names
# in a list
file_path = "./p022_names.txt"
for line in open(file_path):
    names = re.findall(r'([A-za-z]+)',line)
# sort the list
names.sort()

# helper method to determine score of each name
def name_score(name):
    letter_sum = 0
    alphabet = list(string.ascii_uppercase)
    for letter in name:
        letter_sum += (alphabet.index(letter)+1)
    return (letter_sum * (names.index(name)+1))
# iterate over names in list and add total
# the sum of each name to the total score
for name in names:
    total_score += name_score(name)

print("total score: ",total_score)
