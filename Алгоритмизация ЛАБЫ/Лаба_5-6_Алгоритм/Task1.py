from random import randint



cou, sum, proizv = 0, 0, 1
begin_ , end_ = int(input()), int(input())
arr = list(randint(-22, 93) for i in range(20))

for i in range(len(arr)-1):
    if arr[i] % 2 == 0 and i % 2 != 0:
        cou += 1
    if arr[i] % 2 != 0:
        proizv *= arr[i]

for i in range(begin_, end_):
    sum += arr[i]

print(arr)
print(f"Количество: {cou}")
print(f"Произведение: {proizv}")
print(f"Сумма элементов в диапазоне от {begin_} до {end_}")
print(f"Равна: {sum}")


