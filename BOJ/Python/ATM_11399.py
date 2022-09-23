import  sys

n = int(sys.stdin.readline())
line = sorted(list(map(int, sys.stdin.readline().split())))
memo = 0
sum = 0

for i in line:
    memo += i
    sum += memo

print(sum)