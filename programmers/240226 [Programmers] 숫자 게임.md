---
title: '240226 [Programmers] 숫자 게임'
created: '2024-02-26T12:27:23.067Z'
modified: '2024-02-26T12:27:56.950Z'
---

# 240226 [Programmers] 숫자 게임
``` Solved by Deque ```

```python
from collections import deque

def solution(A, B):
    answer = 0
    queueA = deque(sorted(A))
    queueB = deque(sorted(B))
    for i in range(len(A)):
        if queueB[-1] > queueA[-1]:
            answer += 1
            queueA.pop()
            queueB.pop()
            continue
        if queueB[-1] <= queueA[-1]:
            queueA.pop()
            queueB.popleft()
            
    return answer
```
