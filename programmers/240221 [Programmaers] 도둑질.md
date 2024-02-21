---
title: '240221 [Programmaers] 도둑질'
created: '2024-02-21T06:19:59.123Z'
modified: '2024-02-21T06:20:23.715Z'
---

# 240221 [Programmaers] 도둑질
``` Solved by Dynamic Programming ```

```python 
def solution(money):
    answer = 0
    size = len(money)
    cache = [0 for _ in range(size)]
    
    if size == 3:
        return max(money)
    if size == 4:
        for i in range(size-2):
            answer = max(answer, money[i]+money[i+2])
        return answer
            
    for i in range(size-1):
        if i == 0 or i == 1:
            cache[i] = money[i]
            continue
        if i == 2:
            cache[i] = money[i] + money[i-2]
            continue
        cache[i%size] = max(money[i%size] + cache[(i-2)%size], money[i%size] + cache[(i-3)%size])
        answer = max(cache[i%size], answer)
    
    cache = [0 for _ in range(size)]
    money = list(reversed(money))
    
    for i in range(size-1):
        if i == 0 or i == 1:
            cache[i] = money[i]
            continue
        if i == 2:
            cache[i] = money[i] + money[i-2]
            continue
        cache[i%size] = max(money[i%size] + cache[(i-2)%size], money[i%size] + cache[(i-3)%size])
        answer = max(cache[i%size], answer)
    
    return answer
```
