from random import randint



arr = list(randint(-50, 50) for i in range(20))
print(arr)

new_arr = []
for i in range(len(arr)):

    new_arr.append(arr[i])
    if arr[i] < 0:
        new_arr.append(i)

print(new_arr)