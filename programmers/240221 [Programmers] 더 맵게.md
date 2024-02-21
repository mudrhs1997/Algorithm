---
title: '240221 [Programmers] 더 맵게'
created: '2024-02-21T06:32:46.475Z'
modified: '2024-02-21T06:33:15.804Z'
---

# 240221 [Programmers] 더 맵게
``` Solved by Heap ```

```python
import heapq

def solution(scoville, K):
    answer = 0
    heapq.heapify(scoville)
    while scoville[0] < K:
        minimumScoville = heapq.heappop(scoville)
        secondScoville = heapq.heappop(scoville)
        heapq.heappush(scoville, minimumScoville + (secondScoville * 2))
        answer += 1
        if len(scoville) == 1:
            if scoville[0] < K:
                answer = -1
            break
    return answer
```
