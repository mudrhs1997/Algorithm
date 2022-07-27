result = [0 for i in range(5001)]


def solution(n):
    result[0] = 1
    result[2] = 3
    result[4] = 11
    for i in range(6,5000,2):
        sum = 0
        for j in range(0,i-2,2):
            sum += result[j]*2
        result[i] = (result[i-2]*3 + sum)%1000000007

    return result[n]

