---
title: '240207 [Programmers] 점 찍기'
created: '2024-02-07T07:32:32.111Z'
modified: '2024-02-07T07:33:19.363Z'
---

# 240207 [Programmers] 점 찍기
``` Solved by Brute Force ```

```python
def solution(k, d):
    answer = 0
    y = d - (d % k)
    for i in range(0, d+1, k):
        while (y**2+i**2)**(1/2) > d:
            y -= k
        answer +=  y // k + 1
    return answer
```
