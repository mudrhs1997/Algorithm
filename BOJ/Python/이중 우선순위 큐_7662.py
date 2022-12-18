import sys
import heapq

t = int(sys.stdin.readline())

for _ in range(t):
    nHeap, xHeap = [], []
    visited = [False for _ in range(1000001)]
    for i in range(int(sys.stdin.readline())):
        com, num = sys.stdin.readline().split()
        if com == "I":
            heapq.heappush(nHeap, (int(num), i))
            heapq.heappush(xHeap, ((-1)*int(num), i))

            continue
        else:
            if not nHeap or not xHeap:
                continue
            if num == "1":
                while xHeap and visited[xHeap[0][1]]: heapq.heappop(xHeap)
                if xHeap:
                    idx = heapq.heappop(xHeap)[1]
                    visited[idx] = True
                continue
            else:
                while nHeap and visited[nHeap[0][1]]: heapq.heappop(nHeap)
                if nHeap:
                    idx = heapq.heappop(nHeap)[1]
                    visited[idx] = True
                continue
    while nHeap and visited[nHeap[0][1]]: heapq.heappop(nHeap)
    while xHeap and visited[xHeap[0][1]]: heapq.heappop(xHeap)

    if nHeap and xHeap:
        print((-1) * heapq.heappop(xHeap)[0], heapq.heappop(nHeap)[0])
    else:
        print("EMPTY")
