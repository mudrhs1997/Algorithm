---
title: '240202 [Softeer] 효도 음식'
created: '2024-02-02T05:20:58.265Z'
modified: '2024-02-02T05:21:32.577Z'
---

# 240202 [Softeer] 효도 음식
``` Soved by Dynamic Programming ```

```python
import sys
import heapq
from collections import deque


n = int(input())
ingredient = list(map(int, input().split()))
left = []
right = []
result = -sys.maxsize
maxNum = 0

def dynamic_programming(arr):
    cache = [0 for _ in range(len(arr))]
    cache[0] = arr[0]

    for i in range(1, len(arr)):
        cache[i] = max(0, cache[i-1]) + arr[i]

    return cache

for i in range(1, n-1):
    if i == 1:
        left = dynamic_programming(ingredient[0:i])
        right = deque(list(reversed(dynamic_programming(list(reversed(ingredient[i+1:n]))))))
        result = left[0] + right[0]
        maxNum = left[0]
        continue
        
    left.append(max(0, left[-1]) + ingredient[i-1])
    maxNum = max(maxNum, left[-1])
    right.popleft()
    result = max(result, maxNum+right[0])

print(result)

```
