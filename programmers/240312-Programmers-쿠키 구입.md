---
title: 240312-Programmers-쿠키 구입
created: '2024-03-12T09:00:32.761Z'
modified: '2024-03-12T09:01:03.503Z'
---

# 240312-Programmers-쿠키 구입
```Solved by Two-Pointer```

```python
def solution(cookie):
    answer = 0
    l_cookie = [0]
    r_cookie = [0]
    length = len(cookie)
    
    for i in range(len(cookie)):
        l_cookie.append(l_cookie[i]+cookie[i])
        r_cookie.append(r_cookie[i]+cookie[length-1-i])
        
    r_cookie = list(reversed(r_cookie))
        
    for i in range(1, len(cookie)):
        l_pointer = 0
        r_pointer = length
        while i-1 != l_pointer or i != r_pointer:
            l_sum = l_cookie[i] - l_cookie[l_pointer]
            r_sum = r_cookie[i] - r_cookie[r_pointer]
            if l_sum > r_sum:
                l_pointer += 1
                continue
            if l_sum < r_sum:
                r_pointer -= 1
                continue
            if l_sum == r_sum:
                answer = max(answer, l_sum)
                break
        
    return answer

```
