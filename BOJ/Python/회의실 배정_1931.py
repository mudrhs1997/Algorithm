import sys

n = int(sys.stdin.readline())
time = []
memo = [0,0]
count = 0
for _ in range(n):
    time.append(list(map(int, sys.stdin.readline().split())))
time = sorted(time)
time.sort(key = lambda x:x[1])
for i in time:
    if memo[1] > i[0]:
        continue
    memo = i
    count += 1

print(count)