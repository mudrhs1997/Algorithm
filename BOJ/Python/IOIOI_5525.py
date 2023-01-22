import sys

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
s = sys.stdin.readline()
flag = False
memo = ""
count = 0
result = 0

for i in s:
    if i == "I":
        if not flag:
            flag = True
            memo = i
            continue
        elif memo == "O" and count >= n:
            result += 1
            memo = i
            continue
        elif memo == "I":
            count = 0
            continue
        else:
            memo = i

    if i == "O":
        if not flag:
            continue
        elif memo == "I":
            count += 1
            memo = i
            continue
        else:
            count = 0

print(result)

