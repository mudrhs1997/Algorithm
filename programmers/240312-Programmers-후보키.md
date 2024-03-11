---
title: 240312-Programmers-후보키
created: '2024-03-11T17:47:26.406Z'
modified: '2024-03-11T17:48:33.564Z'
---

# 240312-Programmers-후보키
```Solved by Brute-Force, Set```

```python
import copy

def solution(relation):
    answer = 0
    combination = []
    cache = []
    
    def dfs(arr, idx):
        for i in range(idx, len(relation[0])):
            newArr = copy.deepcopy(arr)
            newArr.append(i)
            combination.append(newArr)
            dfs(newArr, i+1)
            
    def find(target):
        for i in range(len(cache)):
            if len(set(cache[i]) - set(target)) == 0:
                   return False
        return True
            
    dfs([], 0)
    combination.sort(key = lambda x:len(x))
    for combi in combination:
        result = [[] for _ in range(len(relation))]
        for i in combi:
            for j in range(len(relation)):
                result[j].append(relation[j][i])
        if len(set(map(tuple, result))) == len(relation):
            if find(combi):
                cache.append(combi)

    return len(cache)


```
