def task1(text: str) -> str:

    textls = text.split()
    for i in range(len(textls)):
        textls[i] = "Oleg" if textls[i] == "Nikolay" else textls[i]

    new_text = " ".join(textls)
    return new_text



def task2(string: str) -> str:

    for i in string:
        if i == "x": return "x"
        elif i == "w": return "w"
    else: return "None"



def task3(string: str) -> int:

    count = 0
    for i in string:
        if i.isdigit():
            count += 1

    return count



print(task1("Nikolay Nikolay"))
print(task2("w x"))
print(task3("3 4 5 6"))



