---
title: '240207 [Programmers] 혼자 놀기의 달인'
created: '2024-02-07T06:50:00.390Z'
modified: '2024-02-07T06:50:27.897Z'
---

# 240207 [Programmers] 혼자 놀기의 달인
``` Solved by DFS ```

```python
def solution(cards):
    answer = 0
    visited = [0 for _ in range(len(cards))]
    
    def dfs(idx, count):
        if visited[idx]:
            return count
        visited[idx] = True
        return dfs(cards[idx]-1, count+1)
        
    for i in range(len(cards)):
        firstGroup = dfs(i, 0)
        secondGroup = 0
        for j in range(len(cards)):
            secondGroup = max(secondGroup, dfs(j, 0))
        answer = max(answer, firstGroup*secondGroup)
        visited = [0 for _ in range(len(cards))]
    
    return answer
    
```
