---
title: 240306-Programmers-테이블 해시 함수
created: '2024-03-06T08:48:22.718Z'
modified: '2024-03-06T08:48:49.846Z'
---

# 240306-Programmers-테이블 해시 함수
```Solved by Bitwise```

```python
from functools import reduce

def solution(data, col, row_begin, row_end):
    result = []
    data.sort(key = lambda x:(x[col-1],-x[0]))
    for i in range(row_begin-1, row_end):
        rowSum = 0
        for number in data[i]:
            rowSum += number%(i+1)
        result.append(rowSum)
    return reduce(lambda acc, value: acc ^ value, result)
```
