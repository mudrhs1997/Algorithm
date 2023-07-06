def solution(board):
    answer = 1
    boardArr = [list(row) for row in board]
    firstSum = 0
    lastSum = 0
    firstCheck = False
    lastCheck = False
    dy = [0, 1]
    dx = [1, 0]
    
    for y, row in enumerate(boardArr):
        for x, value in enumerate(row):
            if value == "O":
                firstSum += 1
                for i in range(2):
                    if boardArr[(y+dy[i])%3][(x+dx[i])%3] == value and boardArr[(y+(dy[i]*2))%3][(x+(dx[i]*2))%3] == value:  
                        firstCheck = True
            if value == "X":
                lastSum += 1
                for i in range(2):
                    if boardArr[(y+dy[i])%3][(x+dx[i])%3] == value and boardArr[(y+(dy[i]*2))%3][(x+(dx[i]*2))%3] == value:
                        lastCheck = True
    
    if (boardArr[0][0] == board[1][1] and boardArr[1][1] == boardArr[2][2]) or (boardArr[0][2] == board[1][1] and boardArr[1][1] == boardArr[2][0]):
        if boardArr[1][1] == "O":
            firstCheck = True
        elif boardArr[1][1] == "X":
            lastCheck = True
    # X가 O보다 많은 경우
    if lastSum > firstSum:
        return 0
    # O가 X보다 2개 이상 많은 경우
    if firstSum > lastSum + 1:
        return 0
    # 둘 중 하나 완성 됐지만 진행된 경우
    if firstCheck and firstSum == lastSum:
        return 0
    if lastCheck and firstSum > lastSum:
        return 0
    # 둘 다 완성된 경우
    if firstCheck and lastCheck:
        return 0
    
    return answer