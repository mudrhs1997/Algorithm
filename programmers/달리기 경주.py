def solution(players, callings):
    answer = []
    ranking = {}
    playerRank = {}
    
    for rank, player in enumerate(players):
        ranking[rank+1] = player
        playerRank[player] = rank+1
        
    for calling in callings:
        beforeRank = playerRank[calling]
        frontPlayer = ranking[beforeRank-1]
        
        playerRank[frontPlayer] = beforeRank
        playerRank[calling] = beforeRank-1
        
        ranking[beforeRank] = frontPlayer
        ranking[beforeRank-1] = calling
        
    for rank in range(len(ranking.keys())):
        answer.append(ranking[rank+1])
        
    return answer