---
title: '240119 [Programmers] 귤 고르기'
created: '2024-01-19T07:07:51.619Z'
modified: '2024-01-19T07:08:08.646Z'
---

# 240119 [Programmers] 귤 고르기
```python
def solution(k, tangerine):
    answer = 0
    numSum = 0
    sizes = {}
    
    for t in tangerine:
        if t in sizes:
            sizes[t] += 1
            continue
        sizes[t] = 1
        
    for size, num in sorted(sizes.items(), key=lambda x:x[1], reverse=True):
        if numSum >= k:
            break
        answer += 1
        numSum += num

            
    return answer
```
