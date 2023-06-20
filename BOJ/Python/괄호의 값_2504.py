import sys

str = sys.stdin.readline().rstrip()
stack = []
result = 0

for char in str:
    print(stack)
    if char == "(" or char == "[":
        stack.append(char)
        continue
    if stack:
        tmp = 0
        while stack:
            if type(stack[-1]) == int:
                tmp += stack.pop(-1)
            else:
                break
        if char == ")":
            if not stack:
                break
            if stack[-1] == "(":
                stack.pop(-1)
                if tmp == 0:
                    stack.append(2)
                else:
                    stack.append(tmp*2)
        elif char == "]":
            if not stack:
                break
            if stack[-1] == "[":
                stack.pop(-1)
                if tmp == 0:
                    stack.append(3)
                else:
                    stack.append(tmp*3)
    else:
        if char == ")" or char == "]":
            break

for s in stack:
    if type(s) != int:
        print(0)
        exit()
    result += s
print(result)