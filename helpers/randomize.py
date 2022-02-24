import random 

minValue = 2
maxValue = 19
numVals = 20

numbers = list(range(minValue, maxValue + 1))

random.shuffle(numbers)

for n in numbers[:-1]:
    print(n, end=', ')

print(numbers[-1], end='')
