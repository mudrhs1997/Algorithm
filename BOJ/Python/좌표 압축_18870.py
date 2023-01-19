import sys

n = int(sys.stdin.readline())

nums = list(map(int, sys.stdin.readline().split()))
sortedNums = sorted(set(nums))
memo = {}

for idx, num in enumerate(sortedNums):
    if num in memo:
        continue
    memo[num] = idx

for num in nums:
    print(str(memo[num]), end=" ")