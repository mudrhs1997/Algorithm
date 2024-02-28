---
title: '240228 [Programmers] 롤케이크 자르기'
created: '2024-02-28T06:52:38.095Z'
modified: '2024-02-28T06:53:11.461Z'
---

# 240228 [Programmers] 롤케이크 자르기
``` Solved by Map ```

```python
def solution(topping):
    answer = 0
    cache = {}
    bro = {}
    
    for t in topping:
        if t in cache:
            cache[t] += 1
            continue
        cache[t] = 1
        
    for i in range(len(topping)):
        
        if topping[i] in bro:
            bro[topping[i]] += 1
        else:
            bro[topping[i]] = 1
        
        cache[topping[i]] -= 1
              
        if cache[topping[i]] == 0:
            cache.pop(topping[i])
              
        if len(bro) == len(cache):
              answer += 1
        
    return answer
```
