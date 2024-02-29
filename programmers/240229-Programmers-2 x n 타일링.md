---
title: 240229-Programmers-2 x n 타일링
created: '2024-02-29T08:40:17.084Z'
modified: '2024-02-29T08:41:58.125Z'
---

# 240229-Programmers-2 x n 타일링
```Solved by Dynamic Programming```

```python
import sys

sys.setrecursionlimit(10**5)
def solution(n):
    answer = 0
    cache = [-1 for _ in range(n+1)]
    
    def dp(num):
        if num == 0:
            return 0
        if num == 1:
            cache[num] = 1
            return cache[num]
        if num == 2:
            cache[num] = 2
            return cache[num]
        if cache[num] != -1:
            return cache[num]
        cache[num] = dp(num-1)+dp(num-2)
        return cache[num] % 1000000007
    
    
    return dp(n)
```
