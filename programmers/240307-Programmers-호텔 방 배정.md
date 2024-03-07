---
title: 240307-Programmers-호텔 방 배정
created: '2024-03-07T07:53:07.471Z'
modified: '2024-03-07T07:53:57.067Z'
---

# 240307-Programmers-호텔 방 배정
```Solved by Map```

```python
import sys

sys.setrecursionlimit(200_001)
def solution(k, room_number):
    answer = []
    cache = {}

    def findRoom(number):
        if number not in cache:
            cache[number] = number + 1
            return number
        cache[number] = findRoom(cache[number])
        return cache[number]
        
    for number in room_number:
        answer.append(findRoom(number))
        
    return answer
```
