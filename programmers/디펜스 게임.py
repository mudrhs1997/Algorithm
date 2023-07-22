# 230720 14:37 ~
# Priority Queue
import heapq

def solution(n, k, enemy):
    answer = 0
    enemy_sum = 0
    pq = []
    
    if k >= len(enemy):
        return len(enemy)
    
    for round, e in enumerate(enemy):
        heapq.heappush(pq, e)
        if len(pq) > k:
            enemy_sum += heapq.heappop(pq)
            if enemy_sum > n:
                break
        answer = round + 1
    
    return answer