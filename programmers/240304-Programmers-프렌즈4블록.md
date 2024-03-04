---
title: 240304-Programmers-프렌즈4블록
created: '2024-03-04T06:51:53.309Z'
modified: '2024-03-04T06:52:48.057Z'
---

# 240304-Programmers-프렌즈4블록
```Solved by Implement```

```python
def solution(m, n, board):
    answer = 0
    x = [1, 0, 1]
    y = [0, 1, 1]
    cache = set([])
    
    for idx, row in enumerate(board):
        board[idx] = list(row)
        
    while True:
        for i in range(m):
            for j in range(n):
                target = board[i][j]
                currentCache = set([(i, j)])
                
                if target == "":
                    continue
                    
                for k in range(3):
                    ny = i + y[k]
                    nx = j + x[k]
                    
                    if 0 <= ny < m and 0 <= nx < n:
                        if target == board[ny][nx]:
                            currentCache.add((ny, nx))
                            continue
                        break
                        
                    break
                    
                if len(currentCache) == 4:
                    cache.update(currentCache)
                    
        if len(cache) == 0:
            break
            
        answer += len(cache)
        
        for cy, cx in sorted(cache):
            for i in range(1, n):
                if cy - i >= 0:
                    board[cy-i+1][cx] = board[cy-i][cx]
                    board[cy-i][cx] = ""
                    continue
                break
        
        cache = set([])
                
    return answer


```
