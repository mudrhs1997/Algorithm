---
title: '240122 [Programmers] 전화번호 목록'
created: '2024-01-22T11:21:42.261Z'
modified: '2024-01-22T11:22:11.550Z'
---

# 240122 [Programmers] 전화번호 목록
```python
def solution(phone_book):
    phone_book.sort()

    for i in range(1, len(phone_book)):
        isPost = True
        for idx, value in enumerate(phone_book[i-1]):
            if value != phone_book[i][idx]:
                isPost = False
                break
        if isPost:
            return False
                
    return True
```
