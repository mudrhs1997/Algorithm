# 230728 18:01 ~ 18:26 (25m)

def solution(n, works):
    answer = 0
    remain_works = sorted(works, reverse = True)

    while n > 0:
        memo = remain_works[0]
        for i in range(len(works)):
            
            if memo > remain_works[i]:
                break
            remain_works[i] = max(remain_works[i]-1, 0)
            n -= 1
            if n == 0:
                break
    
    for work in remain_works:
        answer += work**2
    return answer