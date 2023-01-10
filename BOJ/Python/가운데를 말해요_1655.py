import sys
import heapq

n = int(sys.stdin.readline())
lheap = []
rheap = []

for _ in range(n):
    node = int(sys.stdin.readline())
    if len(lheap) == 0 and len(rheap) == 0:
        heapq.heappush(lheap, (-1)*node)
        heapq.heappush(rheap, node)
        print(node)
        continue
    if len(lheap) == len(rheap):
        if node < rheap[0]:
            heapq.heappop(lheap)
            heapq.heappush(lheap, (-1)*node)
            heapq.heappush(rheap, (-1)*lheap[0])
        else:
            heapq.heappush(rheap, node)
        print(rheap[0])
        continue
    else:
        if node < rheap[0]:
            heapq.heappush(lheap, (-1)*node)
        else:
            heapq.heappush(rheap, node)
            heapq.heappop(rheap)
            heapq.heappush(lheap, (-1) * rheap[0])
        print(rheap[0])
        continue