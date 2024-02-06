---
title: '240206 [Programmers] 숫자 블록'
created: '2024-02-06T09:29:32.441Z'
modified: '2024-02-06T09:30:40.076Z'
---

# 240206 [Programmers] 숫자 블록
``` Solved by Prime Number ```

```python
def solution(begin, end):
    answer = []
    for i in range(begin, end+1):
        answer.append(1)
        
        if i == 1:
            answer[i-begin] = 0
            continue

        for j in range(2, int(i**0.5)+1):
            if i % j == 0:
                if i//j > 10_000_000:
                    answer[i-begin] = j
                    continue
                answer[i-begin] = i//j
                break
                
    return answer
```
