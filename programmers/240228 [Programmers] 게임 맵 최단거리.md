---
title: '240228 [Programmers] 게임 맵 최단거리'
created: '2024-02-28T07:01:51.712Z'
modified: '2024-02-28T07:02:18.342Z'
---

# 240228 [Programmers] 게임 맵 최단거리
```Solved by BFS```

```python
from collections import deque

def solution(maps):
    answer = -1
    x = [1, -1, 0, 0]
    y = [0, 0, 1, -1]
    queue = deque([[0, 0, 1]])
    visited = [[False for _ in range(len(maps[0]))] for _ in range(len(maps))]
    
    while queue:
        cy, cx, count = queue.popleft()
        if cy == len(maps)-1 and cx == len(maps[0])-1:
            answer = count
            break
        for i in range(4):
            dy = cy + y[i]
            dx = cx + x[i]
            if 0 <= dy < len(maps) and 0 <= dx < len(maps[0]):
                if maps[dy][dx] != 0:
                    if not visited[dy][dx]:
                        queue.append([dy, dx, count+1])
                        visited[dy][dx] = True
                    
    
    return answer
```
