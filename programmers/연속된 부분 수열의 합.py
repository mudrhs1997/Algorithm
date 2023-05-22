def solution(sequence, k):
    answer = [0, 1000000]
    firstPoint = 0
    firstSum = 0
    endSum = 0
    for endPoint, value in enumerate(sequence):
        endSum += value
        while endSum - firstSum >= k:
            if endSum - firstSum == k:
                if endPoint - firstPoint < answer[1] - answer[0]:
                    answer = [firstPoint, endPoint]
                firstSum += sequence[firstPoint]
                firstPoint += 1
            elif endSum - firstSum > k:
                firstSum += sequence[firstPoint]
                firstPoint += 1
                
    return answer