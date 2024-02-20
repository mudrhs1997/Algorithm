---
title: '240220 [Programmers] n진수 게임'
created: '2024-02-20T06:24:50.308Z'
modified: '2024-02-20T06:26:15.464Z'
---

# 240220 [Programmers] n진수 게임
``` Solved by mod```

```python
def solution(n, t, m, p):
    answer = ''
    result = ['0']
    for i in range(1, m*1000):
        result += list(reversed(divide(i, n)))
        
    for char in range(p-1, len(result), m):
        answer += result[char]
        if len(answer) == t:
            break
        
    return answer

def divide(number, base):
    result = []
    while number > 0:
        if number%base >= 10:
            result.append(chr(55+number%base))
        else:
            result.append(chr(48+number%base))
        number //= base
    return result
```
