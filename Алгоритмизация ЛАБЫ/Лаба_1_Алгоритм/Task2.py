num = list(input())

num[0], num[-1] = num[-1], num[0]

print("".join(num))