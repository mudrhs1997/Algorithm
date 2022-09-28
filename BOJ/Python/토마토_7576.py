import sys

mn = list(map(int, sys.stdin.readline().split()))
farm = []
visited = [[False for _ in range(mn[0])] for _ in range(mn[1])]
x = [1,-1,0,0]
y = [0,0,1,-1]
queue = []
cnt = 0
startIdx = 0

for i in range(mn[1]):
    row = list(map(int, sys.stdin.readline().split()))
    farm.append(row)
    for j in range(mn[0]):
        if row[j] == 1:
            queue.append([j,i])

def bfs(idx):
    global startIdx
    if visited[idx[1]][idx[0]]:
        return
    visited[idx[1]][idx[0]] = True
    for i in range(4):
        if idx[0]+x[i] > mn[0]-1 or idx[0]+x[i] < 0 or idx[1]+y[i] < 0 or idx[1]+y[i] > mn[1]-1:
            continue
        if visited[idx[1]+y[i]][idx[0]+x[i]] or farm[idx[1]+y[i]][idx[0]+x[i]] == -1 or farm[idx[1]+y[i]][idx[0]+x[i]] == 1:
            continue
        queue.append([idx[0]+x[i],idx[1]+y[i]])
        farm[idx[1]+y[i]][idx[0]+x[i]] = 1

while startIdx<len(queue):
    count = len(queue)
    for b in range(startIdx,count):
        bfs(queue[b])
        startIdx += 1
    cnt += 1

check = True
for i in farm:
    if 0 in i:
        check = False
        break

print(-1 if check == False else cnt-1)
