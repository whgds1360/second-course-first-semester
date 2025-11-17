def midle_treogylar_method(a, b, n:float)->float:

    h = (b - a) / n; x = a + h/2; s = 0
    f = lambda num: 2 * num**3 + (-1 * num**2 + 2 * num)

    while x < b: s += f(x); x += h

    return s * h

global_a = 0
global_b = 0
global_n = 0


print("""
    CASE МЕНЮ 
1 - задать значение a
2 - задать значение b
3 - задать значение n
4 - вычислить функцию 
5 - ВЫХОД
""")

while True:
    try:
        answer = int(input("Выберите пункт меню: "))
    except ValueError:
        print("Пожалуйста, введите число от 1 до 5")
        continue

    match answer:
        case 1:
            print(f"Текущее значение а = {global_a}")
            global_a = float(input("Введите новое значение a: "))

        case 2:
            print(f"Текущее значение b = {global_b}")
            global_b = float(input("Введите новое значение b: "))

        case 3:
            print(f"Текущее значение n = {global_n}")
            global_n = float(input("Введите новое значение n: "))

        case 4:
            if global_n == 0:
                print("Ошибка: n не может быть равно 0!")
                continue
            if global_a >= global_b:
                print("Ошибка: a должно быть меньше b!")
                continue

            print(midle_treogylar_method(global_a, global_b, global_n))

        case 5:
            print("Выход из программы")
            break

        case _:
            print("Неверный пункт меню. Выберите от 1 до 5")

