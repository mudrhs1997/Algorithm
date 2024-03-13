---
title: 240313-Programmers-가장 많이 받은 선물
created: '2024-03-13T08:34:09.842Z'
modified: '2024-03-13T08:34:32.857Z'
---

# 240313-Programmers-가장 많이 받은 선물
```Solved by Hash```

```python
def solution(friends, gifts):
    answer = 0
    cache = [[0 for _ in range(len(friends))] for _ in range(len(friends))]
    dic = {}
    friend = {}
    
    for i in range(len(friends)):
        dic[friends[i]] = [i, 0]
        friend[i] = friends[i]
        
    for gift in gifts:
        give, recieve = gift.split()
        cache[dic[give][0]][dic[recieve][0]] += 1
        dic[give][1] += 1
        dic[recieve][1] -= 1
        
    for i in range(len(cache)):
        result = 0
        for j in range(len(cache[0])):
            if cache[i][j] == cache[j][i]:
                if dic[friend[i]][1] > dic[friend[j]][1]:
                    result += 1
                    continue
            if cache[i][j] > cache[j][i]:
                result += 1
        answer = max(answer, result)
                
    
    return answer
```
