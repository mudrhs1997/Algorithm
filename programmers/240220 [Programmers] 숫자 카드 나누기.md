---
title: '240220 [Programmers] 숫자 카드 나누기'
created: '2024-02-19T14:52:20.814Z'
modified: '2024-02-19T14:54:03.343Z'
---

# 240220 [Programmers] 숫자 카드 나누기
``` Solved by GCD ```

```python
def solution(arrayA, arrayB):
    answer = 0
    
    arrayA.sort()
    arrayB.sort()
    
    def divide(array):
        result = []
        for i in range(1, int(array[0]**(1/2))+1):
            if array[0] % i == 0:
                result.append(array[0]//i)
                result.append(i)
                
        return result
    
    targetA = set(divide(arrayA))
    targetB = set(divide(arrayB))
    
    for target in targetA-targetB:
        isTarget = True

        for b in arrayB:
            if b % target == 0:
                isTarget = False
                break
            
        for a in arrayA:
            if a % target != 0:
                isTarget = False
                break
                
        if isTarget:
            answer = max(answer, target)
            
            
    for target in targetB-targetA:
        isTarget = True

        for a in arrayA:
            if a % target == 0:
                isTarget = False
                break
            
        for b in arrayB:
            if b % target != 0:
                isTarget = False
                break
        if isTarget:
            answer = max(answer, target)
        
    
    return answer
```
