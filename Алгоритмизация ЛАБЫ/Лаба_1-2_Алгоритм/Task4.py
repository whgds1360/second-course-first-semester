from math import sqrt

a, b, c, = int(input()), int(input()), int(input())

p = (a + b + c) / 2
s = sqrt(p * (p - a) * (p - b) * (p - c))

print(f"{s/100:0.2f}")