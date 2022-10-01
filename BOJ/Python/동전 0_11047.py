import sys

n, k = map(int,sys.stdin.readline().split())
cost = list(reversed([int(sys.stdin.readline()) for _ in range(n)]))
count = 0


for c in cost:
    cnt = int(k/c)
    if cnt<0:
        continue
    else:
        k = k-(cnt)*c
        count += int(cnt)

print(count)