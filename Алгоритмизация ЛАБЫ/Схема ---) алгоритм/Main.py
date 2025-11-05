def one():
#Произведение цифр
    n = int(input())
    p = 1

    while n != 0:
        a = n % 10
        p = p * a
        n //= 10

    print(p)


def two():
#кол-во делителей числа
    n = int(input())
    x, k = 1, 0

    while x <= n:
        if n % x == 0:
            k += 1
        x += 1
    print(k)


def three(n:int) -> bool:
#Проверка на совершенность числа
    x, s = 1, 0
    while x < n:
        if n % x == 0:
            s += x
        x += 1

    if s == n :
        print("Да"); return True
    else:
        print("Нет"); return False


def four():
#Количество простых среди n введенных
    n = int(input())
    i, k = 1, 0

    while i <= n:

        x = 1
        c = 0
        y = int(input())

        while x <= y:
            if y % x == 0:
                c += 1
            x += 1

        if c == 2:
            k += 1
        i += 1

    print(k)


def five(nums:list[int]) -> str:
    proiz = 1
    for num in nums:
        if three(num):
            proiz *= num

    return f"Произведение совершенных чисел: {proiz}"



