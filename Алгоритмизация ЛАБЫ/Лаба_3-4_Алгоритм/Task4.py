from random import randint

arr = list((randint(160, 200) for _ in range(15)))
print(arr)
arr_surname = list(map(str, input().split()))


sum = 0
for i in arr:
    sum += i

print(f"Средний рост: {round(sum / 15)}, Максимальный: {max(arr)}, Фамилия: {arr_surname[arr.index(max(arr))]} ")

