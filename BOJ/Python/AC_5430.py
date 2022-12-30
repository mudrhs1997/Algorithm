import sys
from collections import deque

t = int(sys.stdin.readline())

for _ in range(t):
    p = sys.stdin.readline()
    n = int(sys.stdin.readline())
    s = sys.stdin.readline()
    if len(s) > 3:
        arr = deque(s[1:len(s)-2].split(','))
    else:
        arr = deque()
    isReversed = False
    isError = False

    for i in p:
        if i == 'R':
            isReversed = not isReversed
        if i == 'D':
            if len(arr) > 0:
                arr.pop() if isReversed else arr.popleft()
            else:
                isError = True
                break

    if isError:
        print("error")
    else:
        if isReversed:
            arr = list(reversed(arr))
        result = ''
        for i in arr:
            result += ','+i
        print('['+result[1:]+']')