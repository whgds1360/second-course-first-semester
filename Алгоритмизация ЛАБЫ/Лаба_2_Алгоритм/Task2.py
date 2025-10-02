limit = int(input("Лимит: ")); sum = 0
buy = list(map(int, input("Введите через пробел сумму каждого товара!\n").split()))

for i in buy:
    sum += i
    if sum > limit:
        print("Денег не хватит!")
        break

else:
    print("Денег хватит")


