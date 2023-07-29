def solution(n, s):
    answer = [s//n for _ in range(n)]
    
    if n > s:
        return [-1]
    
    for i in range(s%n):
        answer[-i-1] += 1
        
    return answer
