# 230721 22:32 ~ 22:53 (21m)
# 덱

from collections import deque

def solution(operations):
    answer = []
    num_arr = deque([])
    for operation in operations:
        command, num = operation.split()
        if command == "I":
            num_arr.append(int(num))
            num_arr = deque(sorted(num_arr))
        if command == "D":
            if len(num_arr) == 0:
                continue
            if num == "1":
                num_arr.pop()
            if num == "-1":
                num_arr.popleft()
                
    if len(num_arr) == 0:
        return [0, 0]
    elif len(num_arr) == 1:
        return [num_arr[0], num_arr[0]]
    
    return [num_arr.pop(), num_arr[0]]