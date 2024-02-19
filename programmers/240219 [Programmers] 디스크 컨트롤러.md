---
title: '240219 [Programmers] 디스크 컨트롤러'
created: '2024-02-19T10:32:49.453Z'
modified: '2024-02-19T10:33:13.329Z'
---

# 240219 [Programmers] 디스크 컨트롤러

``` Solved by Heap ```

```python
from collections import deque
import heapq

def solution(jobs):
    answer = 0
    queue = deque(sorted(jobs))
    currentTime = 0
    count = 0
    waiting = []
    
    while count != len(jobs):
        while queue and queue[0][0] < currentTime:
            request, time = queue.popleft()
            answer += currentTime - request
            waiting.append([time, request])
            if not queue:
                break
                
        heapq.heapify(waiting)
        
        if not waiting:
            if not queue:
                break
            request, time = queue.popleft()
            currentTime = request + time
            answer += time
            count += 1
            continue
        
        time, request = heapq.heappop(waiting)
        answer += time * (len(waiting)+1)
        count += 1
        currentTime += time
            
    return answer // len(jobs)
```
