from random import randint



arr = list(randint(0, 100) for i in range(20))
print(arr)

if arr == arr.sort():
    print("True")
else:
    print("False")