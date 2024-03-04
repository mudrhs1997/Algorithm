---
title: 240304-Programmers-소수 찾기
created: '2024-03-04T09:50:18.891Z'
modified: '2024-03-04T09:50:49.776Z'
---

# 240304-Programmers-소수 찾기
```Solved by Brute-Force```

```python
def solution(numbers):
    numbers = list(map(int, list(numbers)))
    visited = [False for _ in range(len(numbers))]
    cache = {}
    
    def dfs(number):
        result = 0
        if number > 1:
            if number not in cache:
                result += find(number)
                cache[number] = True
                    
        for i in range(len(numbers)):
            if not visited[i]:
                visited[i] = True
                result += dfs(number*10+numbers[i])
                visited[i] = False
            
        return result

    
    return dfs(0)

def find(number):
    for i in range(2, int(number**(1/2))+1):
        if number % i == 0:
            return 0
    return 1
```
