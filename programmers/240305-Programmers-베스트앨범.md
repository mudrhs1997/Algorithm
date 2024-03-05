---
title: 240305-Programmers-베스트앨범
created: '2024-03-04T14:24:38.569Z'
modified: '2024-03-04T14:25:08.770Z'
---

# 240305-Programmers-베스트앨범
```Solved by Hash```

```python
def solution(genres, plays):
    answer = []
    dic = {}
    cache = []
    idx = 0
    
    for i in range(len(genres)):
        if genres[i] in dic:
            cache[dic[genres[i]]][0] += plays[i]
            cache[dic[genres[i]]][1].append((plays[i], i))
            continue
        dic[genres[i]] = idx
        idx += 1
        cache.append([plays[i], [(plays[i], i)]])
        
    for total, genre in sorted(cache, reverse = True):
        for idx, music in enumerate(sorted(genre, key = lambda x:(-x[0], x[1]))):
            if idx > 1:
                break
            answer.append(music[1])
        
    return answer
```
