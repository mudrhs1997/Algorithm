import sys

sys.setrecursionlimit(10**5)
n = int(sys.stdin.readline())
video = []
param = 0
for _ in range(n):
    video.append(list(sys.stdin.readline().strip()))
while n != 1:
    param += 1
    n /= 2
x = [0, 1]
result = ""

def quadTree(idx, num):
    global result
    for i in range(idx[0], idx[0]+2**num):
        for j in range(idx[1], idx[1]+2**num):
            if video[i][j] != video[idx[0]][idx[1]]:
                result += "("
                for l in x:
                    for r in x:
                        quadTree((idx[0]+2**(num-1)*l, idx[1]+2**(num-1)*r), num-1)
                result += ")"
                return
    result += str(video[idx[0]][idx[1]])

quadTree((0,0), param)

print(result)