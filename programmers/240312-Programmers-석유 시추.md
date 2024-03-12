---
title: 240312-Programmers-석유 시추
created: '2024-03-12T08:13:19.816Z'
modified: '2024-03-12T08:13:48.889Z'
---

# 240312-Programmers-석유 시추
```Solved by BFS, Map```

```python
from collections import deque

def solution(land):
    answer = 0
    idx = 0
    dic = {}
    y = [1, -1, 0, 0]
    x = [0, 0, 1, -1]
    cache = [[-1 for _ in range(len(land[0]))] for _ in range(len(land))]
    queue = deque([])
    
    def bfs(idx):
        while queue:
            cy, cx= queue.popleft()
            dic[idx] += 1
            for i in range(4):
                ny = cy + y[i]
                nx = cx + x[i]
                if 0 <= ny < len(land) and 0 <= nx < len(land[0]) and land[ny][nx] == 1:
                    if cache[ny][nx] != -1:
                        continue
                    queue.append([ny, nx])
                    cache[ny][nx] = idx
            
    
    for i in range(len(land)):
        for j in range(len(land[0])):
            if land[i][j] == 1 and cache[i][j] == -1:
                dic[idx] = 0
                queue.append([i, j])
                cache[i][j] = idx
                bfs(idx)
                idx += 1
    
    for i in range(len(cache[0])):
        oils = set([])
        oilSum = 0
        for j in range(len(cache)):
            if cache[j][i] >= 0:
                oils.add(cache[j][i])
        for oil in oils:
            oilSum += dic[oil]
        answer = max(oilSum, answer)
        
    return answer
```
