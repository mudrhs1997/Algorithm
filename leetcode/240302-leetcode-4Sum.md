---
title: 240302-leetcode-4Sum
created: '2024-03-02T07:43:01.393Z'
modified: '2024-03-02T07:43:51.156Z'
---

# 240302-leetcode-4Sum
```Solved by Map```

```python
class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        answer = []
        dic = {}
        cache = {}
        for idx, value in enumerate(nums):
            dic[value] = idx
        for i in range(len(nums)-3):
            for j in range(i+1, len(nums)-2):
                for l in range(j+1, len(nums)-1):
                    key = target-nums[i]-nums[j]-nums[l]
                    if key in dic and dic[key] > l:
                        result = sorted([nums[i], nums[j], nums[l], key])
                        cache_key = (result[0], result[1], result[2], result[3])
                        if cache_key in cache:
                            continue
                        cache[cache_key] = True
                        answer.append(result)

        return answer

```
