---
title: '240228 [Programmers] 숫자 변환하기'
created: '2024-02-28T06:34:59.448Z'
modified: '2024-02-28T06:35:28.258Z'
---

# 240228 [Programmers] 숫자 변환하기
``` Solved by Dynamic Programming ```

```python
import sys

INF = sys.maxsize
sys.setrecursionlimit(10**7)
def solution(x, y, n):
    answer = 0
    cache = [INF for _ in range(y+1)]
    
    def dp(number):
        if number <= 0:
            return INF
        
        if number == x:
            return 0
        
        if cache[number] != INF:
            return cache[number]
        
        even = INF
        odd = INF
        minus = dp(number-n)
        
        if number % 2 == 0:
            even = dp(number//2)
        if number % 3 == 0:
            odd = dp(number//3)
            
        cache[number] = min(even, odd, minus) + 1
        
        return cache[number]
    
    answer = dp(y)
    
    if answer >= INF:
        return -1
        
    return answer
```
