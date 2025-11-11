def my_decorator(func):
    def wrapper():
        print("FUCK")
        for k in func():
            print(k)
        print("YOU")
    return wrapper

@my_decorator
def my_generator():
    for j in range(10):
        yield j

my_generator()