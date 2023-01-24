import sys

sys.setrecursionlimit(10**5)
paper = []
n = int(sys.stdin.readline())
for _ in range(n):
    paper.append(list(sys.stdin.readline().split()))
param = 0
while n != 1:
    param += 1
    n /= 3
x = [0,1,2]
y = [0,1,2]
result = {'-1': 0, '0': 0, '1': 0}

def cut(idx, num):
    for i in range(idx[0], idx[0]+3**num):
        for j in range(idx[1], idx[1]+3**num):
            if paper[i][j] != paper[idx[0]][idx[1]]:
                for l in x:
                    for r in y:
                        cut((idx[0]+3**(num-1)*l, idx[1]+3**(num-1)*r), num-1)
                return
    result[paper[idx[0]][idx[1]]] += 1

cut((0,0), param)

print(result['-1'])
print(result['0'])
print(result['1'])