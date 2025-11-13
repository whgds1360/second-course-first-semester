def midle_treogylar_method(a, b, n:float)->float:

    h = (b - a) / n; x = a + h/2; s = 0
    f = lambda x: 2 * x**3 + (-1 * x**2 + 2**x)

    while x < b: s += f(x); x += h

    return s * h


a, b, n = float(input("а = ")), float(input("b = ")), float(input("n = "))
print(midle_treogylar_method(a, b, n))
