---
title: 240229-Programmers-124나라의숫자
created: '2024-02-29T09:00:40.633Z'
modified: '2024-02-29T09:01:34.635Z'
---

# 240229-Programmers-124_나라의_숫자
```Solved by Mod```

```python
def solution(n):
    answer = []
    world = ['4', '1', '2']
    
    while n > 0:
        answer.append(world[n%3])
        if n % 3 == 0:
            n = n // 3 - 1
            continue
        n = n // 3
        
    return "".join(reversed(answer))
```
