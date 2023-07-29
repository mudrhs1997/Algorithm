# 230724 17:28 ~ 18:11 (52m)
# Dynamic Programming

def solution(triangle):

    for i, row in enumerate(triangle):
        if i == 0:
            continue
        for j, element in enumerate(row):
            firstNum = 0
            secondNum = 0
            if 0 <= j-1 < i:
                firstNum = triangle[i][j] + triangle[i-1][j-1]
            if 0 <= j < i:
                secondNum = triangle[i][j] + triangle[i-1][j]
                
            triangle[i][j] = max(firstNum, secondNum)
            
    return max(triangle[-1])