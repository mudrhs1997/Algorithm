import sys

n = int(sys.stdin.readline())
arr_left = list(map(int, sys.stdin.readline().split()))
arr_right = list(reversed(arr_left))
memo_left = [0 for _ in range(n)]
memo_right = [0 for _ in range(n)]
result = 0

def dp(idx, info):
    value = -1
    for i in range(idx):
        if info == 'left':
            if arr_left[i] < arr_left[idx] and memo_left[i] > value:
                memo_left[idx] = memo_left[i] + 1
                value = memo_left[i]
        else:
            if arr_right[i] < arr_right[idx] and memo_right[i] > value:
                memo_right[idx] = memo_right[i] + 1
                value = memo_right[i]

for i in range(n):
    dp(i, 'left')
    dp(i, 'right')
for i in range(n):
    result = max(memo_left[i]+memo_right[n-i-1],result)


print(result+1)