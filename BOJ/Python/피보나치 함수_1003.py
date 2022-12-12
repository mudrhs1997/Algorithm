import sys

n = int(sys.stdin.readline())
memo = [(0,0) for _ in range(41)]

def fibo(n):
    if n == 0:
        memo[n] = (1,0)
        return memo[n]
    if n == 1:
        memo[n] = (0,1)
        return memo[n]
    if memo[n] != (0,0):
        return memo[n]
    else :
        first = fibo(n-1)
        second = fibo(n-2)
        memo[n] = (first[0]+second[0], first[1]+second[1])
        return memo[n]
    
for _ in range(n):
    result = fibo(int(sys.stdin.readline()))
    print(result[0], result[1])