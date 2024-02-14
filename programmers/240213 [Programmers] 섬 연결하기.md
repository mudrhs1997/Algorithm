---
title: '240213 [Programmers] 섬 연결하기'
created: '2024-02-13T09:33:52.260Z'
modified: '2024-02-14T11:25:36.594Z'
---

# 240213 [Programmers] 섬 연결하기
``` Solved by MST ```

```python
import sys

def solution(n, costs):
    answer = 0
    costs.sort(key = lambda x:x[2])
    parent = [i for i in range(n)]
    
    def find(node):
        if parent[node] == node:
            return node
        return find(parent[node])
    
    def union_find(fnode, snode):
        fparent = find(fnode)
        sparent = find(snode)
        if fparent > sparent:
            parent[fparent] = sparent
        else:
            parent[sparent] = fparent
        
    for fnode, snode, cost in costs:
        if find(fnode) == find(snode):
            continue
        answer += cost
        union_find(fnode, snode)
    
    return answer
```
