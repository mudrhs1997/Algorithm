---
title: 240304-Programmers-단속카메라
created: '2024-03-04T09:07:49.624Z'
modified: '2024-03-04T09:08:36.727Z'
---

# 240304-Programmers-단속카메라
```Solved by Greedy```

```python
def solution(routes):
    answer = 0
    times = []
    cache = {}
    currentCar = []
    
    for idx, time in enumerate(routes):
        start = time[0]
        end = time[1]
        
        times.append([start, idx, 1])
        times.append([end, idx, 2])

    for time, idx, count in sorted(times, key = lambda x:(x[0], x[2])):
        if count == 1:
            currentCar.append(idx)
            continue
        if count == 2:
            if idx in cache:
                continue
            for car in currentCar:
                cache[car] = True
            answer += 1
            currentCar = []
            continue
    
    return answer
```
