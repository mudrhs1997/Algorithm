import sys

sys.setrecursionlimit(10**5)
a, b, c = map(int, sys.stdin.readline().split())

def dnc(num):
    global a, c
    if num == 1:
        return a % c

    if num % 2 == 0:
        return (dnc(num//2)**2)%c

    return ((dnc(num//2)**2)*a)%c

print(dnc(b))