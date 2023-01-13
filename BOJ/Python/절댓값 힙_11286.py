import sys
import heapq

n = int(sys.stdin.readline())
plus = []
minus = []

for _ in range(n):
    command = int(sys.stdin.readline())
    if command == 0:
        if len(plus) == 0 and len(minus) == 0:
            print(0)
            continue
        elif len(plus) == 0:
            print((-1)*minus[0])
            heapq.heappop(minus)
            continue
        elif len(minus) == 0:
            print(plus[0])
            heapq.heappop(plus)
            continue
        if minus[0] <= plus[0]:
            print((-1)*minus[0])
            heapq.heappop(minus)
        else:
            print(plus[0])
            heapq.heappop(plus)
    else:
        if command <= 0:
            heapq.heappush(minus, (-1)*command)
        else:
            heapq.heappush(plus, command)