# 2023.07.18 13:22 ~ 15:24 (2h 2m)
# 브루트 포스

def solution(users, emoticons):
    answer = [[0, 0] for i in range(40001)]

    for idx, user in enumerate(users):
        buyEmoticons(answer, user, 0, 0, emoticons, 0)
        
    return sorted(answer, reverse = True)[0]

def buyEmoticons(answer, user, idx, depth, emoticons, emoticon_sum):
    emoticon_length = len(emoticons)
    if depth == emoticon_length:
        if emoticon_sum >= user[1]:
            answer[idx][0] += 1
        else:
            answer[idx][1] += emoticon_sum
        return
    
    for i in reversed(range(1, 5)):
        if user[0] > i*10:
            buyEmoticons(answer, user, idx*4+i, depth+1, emoticons, emoticon_sum)
            continue
        buyEmoticons(answer, user, idx*4+i, depth+1, emoticons, emoticon_sum + (emoticons[depth] * (10-i))//10)
