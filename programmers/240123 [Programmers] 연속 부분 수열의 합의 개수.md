---
title: '240123 [Programmers] 연속 부분 수열의 합의 개수'
created: '2024-01-23T10:59:33.178Z'
modified: '2024-01-23T11:00:05.141Z'
---

# 240123 [Programmers] 연속 부분 수열의 합의 개수
```python
def solution(elements):
    sums, n = [], len(elements)
    elements += elements[:-1]
    print(elements)
    for i, a in enumerate(elements):
        SUM = a
        sums.append(SUM)
        for b in elements[i + 1:i + n]:
            SUM += b
            sums.append(SUM)

    return len(list(set(sums)))
```
