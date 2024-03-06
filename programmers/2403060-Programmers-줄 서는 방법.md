---
title: 2403060-Programmers-줄 서는 방법
created: '2024-03-06T08:22:33.350Z'
modified: '2024-03-06T08:23:07.245Z'
---

# 2403060-Programmers-줄 서는 방법
```Solved by Modulo```

```python
def solution(n, k):
    answer = []
    numbers = [i+1 for i in range(n)]
    currentNum = n
    k = k - 1
    
    for i in range(n):
        loc = 1
        count = 0
        if currentNum == 2:
            for i in range(len(numbers)):
                if numbers[i] == 0:
                    continue

                if count == k:
                    answer.append(numbers[i])
                    numbers[i] = 0
                    break
            
                count += 1
                currentNum -= 1
                continue
            
        if currentNum == 1:
            for i in range(len(numbers)):
                if numbers[i] == 0:
                    continue
                answer.append(numbers[i])
            break
            
        
        for i in range(1, currentNum):
            loc *= i
            
        for i in range(len(numbers)):
            if numbers[i] == 0:
                continue
                
            if count == k//loc:
                answer.append(numbers[i])
                numbers[i] = 0
                break
            
            count += 1
                
        currentNum -= 1
        k = k%loc
    
    return answer
```
