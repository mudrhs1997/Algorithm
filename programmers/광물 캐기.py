import copy

def solution(picks, minerals):
    answer = 0
    picks_count = copy.deepcopy(picks)
    stemina = [[] for _ in range(sum(picks_count))]
    
    for idx, mineral in enumerate(minerals):
        if idx//5 > sum(picks_count)-1:
            break
        if mineral == "diamond":
            stemina[idx//5].append(25)
        if mineral == "iron":
            stemina[idx//5].append(5)
        if mineral == "stone":
            stemina[idx//5].append(1)
            
    sotred_stemina = sorted(stemina, key=lambda x: len(x))
    
    for mineral_sum in sorted(sotred_stemina, reverse=True , key=lambda x : (sum(x))):
        if mineral_sum == []:
                break
                
        for idx, pick in enumerate(picks_count):
            if pick != 0:
                if idx == 0:
                    for result in mineral_sum:
                        answer += 1
                elif idx == 1:
                    for result in mineral_sum:
                        answer += result // 5 + result % 5
                elif idx == 2:
                    for result in mineral_sum:
                        answer += result
                picks_count[idx] -= 1
                break
                
                    
    return answer