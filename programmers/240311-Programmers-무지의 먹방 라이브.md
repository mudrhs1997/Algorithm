---
title: 240311-Programmers-무지의 먹방 라이브
created: '2024-03-11T13:13:39.757Z'
modified: '2024-03-11T13:14:06.374Z'
---

# 240311-Programmers-무지의 먹방 라이브
```Solved by Heap```

```python
import heapq

def solution(food_times, k):
    answer = 0
    cache = []
    currentCount = 0
    currentTime = 0
    
    for i in range(len(food_times)):
        cache.append([food_times[i], i])
        
    heapq.heapify(cache)
    
    for _ in range(len(food_times)):
        if not cache:
            return -1
        time, idx = cache[0]
        if k - (time - currentTime) * len(cache) < 0:
            currentCount += len(cache) * (k // len(cache))
            break
        k -= (time - currentTime) * len(cache)
        currentTime = time
        food_times[idx] = 0
        while cache and cache[0][0] == time:
            food_times[cache[0][1]] = 0
            heapq.heappop(cache)
            
    for i in range(len(food_times)):
        if food_times[i] == 0:
            continue
            
        if currentCount == k:
            return i + 1
        
        currentCount += 1
        
    return answer
```
