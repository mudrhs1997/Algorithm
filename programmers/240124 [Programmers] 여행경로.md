---
title: '230124 [Programmers] 여행경로'
created: '2024-01-24T13:42:05.046Z'
modified: '2024-01-24T13:42:38.333Z'
---

# 230124 [Programmers] 여행경로
```python

import copy

def solution(tickets):
    answer = []
    result = []
    visited = [False for _ in range(len(tickets))]
    country = {}
    tickets.sort(key=lambda x:(x[0],x[1]))
    
    for idx, value in enumerate(tickets):
        if value[0] not in country:
            country[value[0]] = idx
            continue
        country[value[0]] = min(idx, country[value[0]])
    
    def dfs(departure, answer):
        answer.append(departure)
        
        if len(answer) == len(tickets)+1:
            result.append(copy.deepcopy(answer))
            return
        
        if departure not in country:
            return
        
        idx = country[departure]
        for i in range(idx, len(tickets)):
            if tickets[i][0] != departure:
                break
            if visited[i]:
                continue
            visited[i] = True
            dfs(tickets[i][1], answer)
            visited[i] = False
            answer.pop()
        
    dfs("ICN", answer)
        
    return result[0]
  ```
