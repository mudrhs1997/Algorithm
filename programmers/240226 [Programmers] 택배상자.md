---
title: '230226 [Programmers] 택배상자'
created: '2024-02-26T10:55:03.027Z'
modified: '2024-02-26T10:55:37.643Z'
---

# 230226 [Programmers] 택배상자
``` Solved by Stack, Queue ```

```python
from collections import deque

def solution(order):
    answer = 0
    stack = []
    queue = deque(order)
    
    for i in range(1, len(order)+2):
        while stack:
            if queue[0] != stack[-1]:
                break
            if queue[0] == stack[-1]:
                answer += 1
                stack.pop()
                queue.popleft()

        if queue:
            if i == queue[0]:
                answer += 1
                queue.popleft()
                continue

            if queue and i != queue[0]:
                stack.append(i)
                
                
    return answer
```
