import sys

t = int(sys.stdin.readline())
arr = {}

for _ in range(t):
    n = int(sys.stdin.readline())
    arr = {}
    result = 1
    for _ in range(n):
        value, key = sys.stdin.readline().split()
        if key in arr:
            arr[key] += 1
        else:
            arr[key] = 2
    for v in arr.values():
        result *= v
    print(result-1)