import sys

n, m = map(int, sys.stdin.readline().split())
arr = [0]+list(map(int, sys.stdin.readline().split()))
idx = 0
result = 0

for i in range(1, n+1):
    arr[i] = arr[i-1] + arr[i]
    while arr[i] - arr[idx] >= m:
        if arr[i] - arr[idx] == m:
            result += 1
        if idx == i:
            break
        idx += 1

print(result)