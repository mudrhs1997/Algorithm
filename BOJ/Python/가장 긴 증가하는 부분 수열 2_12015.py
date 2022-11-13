import sys
from bisect import bisect_left

n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))
result = [0]
cnt = 0

for i in arr:
    if result[-1] < i:
        result.append(i)
        cnt += 1
        continue
    else:
        index = bisect_left(result, i)
        result[index] = i

print(cnt)
