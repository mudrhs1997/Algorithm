---
title: '240227 [Programmers] 시소 짝꿍'
created: '2024-02-27T09:53:10.196Z'
modified: '2024-02-27T09:54:20.063Z'
---

# 240227 [Programmers] 시소 짝꿍
``` Solved by Brute Force ```

```python
def solution(weights):
    answer = 0
    cache = [0 for _ in range(2001)]
    weights.sort()

    for weight in weights:
        if cache[weight] != 0:
            answer += cache[weight]
        cache[weight] += 1
        if weight % 2 == 0:
            cache[(weight//2) * 3] += 1
        if weight % 3 == 0:
            cache[(weight//3) * 4] += 1
        cache[weight * 2] += 1
        
    return answer
```
