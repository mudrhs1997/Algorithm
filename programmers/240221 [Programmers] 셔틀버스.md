---
title: '240221 [Programmers] 셔틀버스'
created: '2024-02-21T07:18:21.233Z'
modified: '2024-02-21T07:19:09.529Z'
---

# 240221 [Programmers] 셔틀버스
``` Solved by Deque```

```python
from collections import deque

def solution(n, t, m, timetable):
    answer = 0
    time = 540
    timetable.sort()
    
    def timeSplit(time):
        h, m = list(map(int, time.split(":")))
        return h*60 + m
    
    queue = deque(list((map(timeSplit, timetable))))
    dequeue = deque([])
    
    for i in range(n):
        while queue and queue[0] <= time:
            dequeue.append(queue.popleft())
            
        if len(dequeue) < m:
            answer = time
            dequeue = deque([])
            
        if len(dequeue) >= m:
            for i in range(m):
                answer = dequeue.popleft() - 1
        
        time += t

    return "{0:02d}:{1:02d}".format(answer//60, answer%60)
```
