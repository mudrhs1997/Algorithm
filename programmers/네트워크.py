# 230726 15:20 ~ 15:49 (29m)
# 그래프

def solution(n, computers):
    answer = 0
    
    for i in range(n):
        for j in range(n):
            if computers[i][j]:
                connect(i, computers)
                answer += 1

    return answer

def connect(node, computers):
    for idx, computer in enumerate(computers[node]):
        if idx == node:
            computers[node][idx] = 0
            continue
        if computer == 1:
            computers[node][idx] = 0
            connect(idx, computers)