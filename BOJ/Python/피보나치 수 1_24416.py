n = int(input())
recursion = 0
dp = 0
f = [0 for i in range(41)]

def fib(n):
    if n == 1 or n == 2:
        global recursion
        recursion += 1
        return 1
    else:
        return fib(n-1)+fib(n-2)

def fibonacci(n):
    f[1],f[2] = 1,1
    for i in range(3, n+1):
        global dp
        dp += 1
        f[n] = f[n-1] + f[n-2]
    return f[n]

fib(n)
fibonacci(n)

print(recursion, dp)
