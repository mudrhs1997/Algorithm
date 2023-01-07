import sys
import heapq

n = int(sys.stdin.readline())
heap = []
for _ in range(n):
    command = int(sys.stdin.readline())
    if command == 0:
        if len(heap) == 0:
            print(0)
            continue
        print((-1)*heap[0])
        heapq.heappop(heap)
    else:
        heapq.heappush(heap, (-1)*command)