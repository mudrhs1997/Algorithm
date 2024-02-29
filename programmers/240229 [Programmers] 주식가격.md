---
title: '240229 [Programmers] 주식가격'
created: '2024-02-29T08:23:26.356Z'
modified: '2024-02-29T08:23:44.134Z'
---

# 240229 [Programmers] 주식가격
```Solved by Stack```

```python
def solution(prices):
    answer = [len(prices)-i-1 for i in range(len(prices))]
    stack = []
    
    for i in range(len(prices)):
        while stack:
            if stack[-1][1] > prices[i]:
                answer[stack[-1][0]] = i-stack[-1][0]
                stack.pop()
                continue
            break
        stack.append([i, prices[i]])
            
                
        
    return answer
```
