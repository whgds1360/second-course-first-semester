from random import randint


def task1(array: list[int]) -> str:
    print(f"Исходный массив: {array}")

    min1, min2 = 0,0
    minimum = float('inf')
    for i in range(len(array)):
        for j in range(1, len(array)-1):
            if abs(array[i] - array[j]) < minimum:
                minimum = abs(array[i] - array[j])
                min1 = array[i]
                min2 = array[j]

    return f"{min1} {min2}"

arr = list(randint(1, 10) for _ in range(10))
print(task1(arr), "\n\n")

def task2(string_, substring_: str) -> int:
    print(f"Исходная строка {string_}")

    counter = string.count(substring_)
    return counter

string = "апапап"
substring = "ап"
print(task2(string, substring), "\n\n")

def task3(string_2_, substring_2_: str) -> int:
    print(print(f"Исходная строка {string}"))

    counter = 0
    for i in range(len(string_2_) - len(substring_2_) + 1):
        if string_2_[i:i + len(substring_2_)] == substring_2_:
            counter += 1

    return counter

string_2 = input()
substring_2 = input()
print(task3(string_2, substring_2))


