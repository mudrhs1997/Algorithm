def solution(sticker):
    cnt = len(sticker)
    memo = [0 for _ in range(cnt)]
    result = []
    
    if cnt == 1:
        return sticker[0]
    elif cnt > 2:
        memo[2] = sticker[2]
        for i in range(2, cnt):
            near1, near2 = i+2, i+3
            if near1 < cnt:
                memo[near1] = max(memo[near1], memo[i] + sticker[near1])
            if near2 < cnt:
                memo[near2] = max(memo[near2], memo[i] + sticker[near2])    
        result.append(max(memo))
    
    memo = [0 for _ in range(cnt)]
    memo[0] = sticker[0]
    for i in range(cnt):
        near1, near2 = i+2, i+3
        if i == 1:
            continue
        if near1 < cnt-1:
            memo[near1] = max(memo[near1], memo[i] + sticker[near1])
        if near2 < cnt-1:
            memo[near2] = max(memo[near2], memo[i] + sticker[near2])
            
    result.append(max(memo))
    
    memo = [0 for _ in range(cnt)]
    memo[1] = sticker[1]
    for i in range(cnt):
        if i == 0 or i == 2:
            continue
        near1, near2 = i+2, i+3
        if near1 < cnt:
            memo[near1] = max(memo[near1], memo[i] + sticker[near1])
        if near2 < cnt:
            memo[near2] = max(memo[near2], memo[i] + sticker[near2])
            
    result.append(max(memo))
    
    return max(result)