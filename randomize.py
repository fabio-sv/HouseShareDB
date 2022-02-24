import random 

numbers = list(range(1, 20 + 1))
random.shuffle(numbers)
for n in numbers[:-1]:
    print(n, end=', ')
print(numbers[-1], end='')
