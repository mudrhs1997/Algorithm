---
title: '240213 [Programmers] 마법의 엘리베이터'
created: '2024-02-13T06:49:01.670Z'
modified: '2024-02-13T06:49:35.049Z'
---

# 240213 [Programmers] 마법의 엘리베이터
```python
def solution(storey):
    answer = 0
    
    while storey > 0:
        floor = storey % 10
        if floor > 5:
            answer += 10 - floor
            storey += 10 - floor
        elif floor == 5:
            answer += floor
            if storey % 100 > 50:
                storey += 10 - floor
            # else:
            #     stroey -= floor
        else:
            answer += floor
            
        storey //= 10
            
    return answer
```
