import sys
import heapq

n = int(sys.stdin.readline())
heap = []

for _ in range(n):
    ipt = int(sys.stdin.readline())
    if ipt == 0 :
        if not heap:
            print(0)
            continue
        print(heapq.heappop(heap))
    else:
        heapq.heappush(heap, ipt)
