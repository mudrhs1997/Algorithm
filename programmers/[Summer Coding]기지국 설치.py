def solution(n, stations, w):
    answer = 0
    newStations = [1] + stations + [n]
    for i in range(1, len(newStations)):
        if i == 1 or i == len(newStations)-1:
            interval = newStations[i] - newStations[i-1] - w
        else :
            interval = newStations[i] - newStations[i-1] - 1 - (2*w)
        if interval > 0:
            answer += interval // ((2*w)+1)
            if interval % ((2*w)+1) > 0:
                answer += 1

    return answer