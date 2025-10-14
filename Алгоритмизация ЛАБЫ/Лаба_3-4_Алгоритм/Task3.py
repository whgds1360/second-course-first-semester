slovar = {
    1: "Спорт",
    2: "Исскуство",
    3: "Прочие"
}
print(slovar)
arr = list(map(int, input("Заполните массив согласно словарю сверху \n").split()))

print(
    f"Марок по спорту: {arr.count(1)}\n"
    f"Марок по искусству: {arr.count(2)}\n"
    f"Марок по прочему: {arr.count(3)}"
      )
