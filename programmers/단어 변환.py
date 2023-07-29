# 230728 18:29 ~ 19:29 (1h)
# BFS

from collections import deque

def solution(begin, target, words):
    answer = 0
    queue = deque([[0, begin]])
    memo = []
    word_len = len(begin)
    
    if not target in words:
        return 0
    
    while queue:
        depth, current_word = queue.popleft()
        memo.append(current_word)
        if current_word == target:
            answer = depth
            break
            
        for word in words:
            num = 0
                
            if word in memo:
                continue

            for idx in range(word_len):
                if current_word[idx] != word[idx]:
                    num += 1

            if num == 1:
                queue.append([depth+1, word])
    
    return answer