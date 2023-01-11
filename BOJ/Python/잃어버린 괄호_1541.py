import sys

m = sys.stdin.readline().split('-')
ans = 0

for i in range(len(m)):
    if not m[i].isnumeric():
        s = m[i].split('+')
        result = 0
        for j in s:
            result += int(j)
        if i == 0:
            ans += result
        else :
            ans -= result
    else:
        if i == 0:
            ans = int(m[i])
        else :
            ans -= int(m[i])

print(ans)