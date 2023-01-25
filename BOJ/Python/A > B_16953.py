import sys

a, b = map(int, sys.stdin.readline().split())

result = sys.maxsize

def dp(num, cnt):
    global b, result
    if num > b:
        return
    if num == b:
        result = min(result, cnt)
        return
    dp(num*2, cnt+1)
    dp(num*10+1, cnt+1)

dp(a, 1)

if result == sys.maxsize:
    print(-1)
else:
    print(result)