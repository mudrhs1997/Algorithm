---
title: '240227 [Programmers] 보석 쇼핑'
created: '2024-02-27T11:15:37.919Z'
modified: '2024-02-27T11:16:34.033Z'
---

# 240227 [Programmers] 보석 쇼핑
``` Solved by Two Pointer ```

```python
def solution(gems):
    answer = [0, 100_000]
    count = len(set(gems))
    gems.reverse()
    cache = {}
    pointer = 0
    
    for i in range(len(gems)):

        if gems[i] in cache:
            cache[gems[i]] += 1
        else:
            cache[gems[i]] = 1
            
        if len(cache) == count:
            result = [0, 0]
            result[0] = len(gems) - i
            
            while len(cache) == count:
                cache[gems[pointer]] -= 1
                
                if cache[gems[pointer]] == 0:
                    cache.pop(gems[pointer])
                
                result[1] = len(gems) - pointer
                pointer += 1
            
            if answer[1]-answer[0] >= result[1]-result[0]:
                answer = result
                
    return answer
```
