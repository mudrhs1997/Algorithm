---
title: '240201 [Programmers] 할인 행사'
created: '2024-02-01T05:07:48.696Z'
modified: '2024-02-01T05:08:22.347Z'
---

# 240201 [Programmers] 할인 행사
``` Solved by Two Pointer ```
```python
def solution(want, number, discount):
    answer = 0
    idx = 0
    startIdx = 0
    result = [0 for _ in range(len(want))]
    recipe = {}
    
    for item in want:
        recipe[item] = idx
        idx += 1

    for i in range(len(discount)):
        if i < 10:
            if discount[i] in recipe:
                result[recipe[discount[i]]] += 1
            if result == number:
                answer += 1
            continue
        
        if discount[i] in recipe:
            result[recipe[discount[i]]] += 1
            
        if discount[startIdx] in recipe:
            result[recipe[discount[startIdx]]] -= 1
        
        startIdx += 1

        if result == number:
            answer += 1
        
        
    return answer
```
