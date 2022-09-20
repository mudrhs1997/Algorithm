import  sys

n = int(sys.stdin.readline())
facto = 1
result = 0

for i in range(1,n+1):
        facto *= i

for i in reversed(str(facto)):
        if i == "0":
                result += 1
        else :
                break
print(result)