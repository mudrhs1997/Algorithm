---
title: 240307-Programmers-우박수열 정적분
created: '2024-03-07T07:28:36.952Z'
modified: '2024-03-07T07:29:06.968Z'
---

# 240307-Programmers-우박수열 정적분
```Solved by Prefix-Sum```

```python
def solution(k, ranges):
    answer = []
    sequence = []
    cache = [0]
    
    while True:
        if sequence:
            cache.append(cache[-1]+min(k,sequence[-1])+(abs(k-sequence[-1]))*(1/2))
                         
        sequence.append(k)
        
        if k == 1:
            break
        if k % 2 == 0:
            k = k // 2
            continue
        if k % 2 == 1:
            k = k * 3 + 1
            continue
        
    for start, end in ranges:
        if len(cache)-1+end < start:
            answer.append(-1)
            continue
        answer.append(cache[len(cache)-1+end]-cache[start])
        
    return answer
```
