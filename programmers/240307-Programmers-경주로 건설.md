---
title: 240307-Programmers-경주로 건설
created: '2024-03-07T05:12:14.021Z'
modified: '2024-03-07T05:12:43.643Z'
---

# 240307-Programmers-경주로 건설
```Solved by DP, BFS```

```python
from collections import deque
import sys

INF = sys.maxsize
def solution(board):
    answer = INF
    x = [0, 1, 0, -1]
    y = [-1, 0, 1, 0]
    queue = deque([[0, 0, 0, 1], [0, 0, 0, 2]])
    visited = [[0 if i == 0 and j == 0 else INF for i in range(len(board[0]))] for j in range(len(board))]

    while queue:
        cy, cx, count, direction = queue.popleft()
        
        if cy == len(board)-1 and cx == len(board[0])-1:
            answer = min(answer, count)
            continue
            
        for i in range(4):
            dy = cy + y[i]
            dx = cx + x[i]
            if 0 <= dy < len(board) and 0 <= dx < len(board[0]) and board[dy][dx] == 0:
                if direction != i:
                    if visited[dy][dx] + 500 > count + 600:
                        queue.append([dy, dx, count + 600, i])
                        visited[dy][dx] = count + 600
                else:
                    if visited[dy][dx] + 500 > count + 100:
                        queue.append([dy, dx, count + 100, i])
                        visited[dy][dx] = count + 100
                        
    return answer
```
