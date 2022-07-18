n = int(input())
cards = input().split()
m = int(input())
nums = input().split()
newCards = list(map(int, cards))
newNums = list(map(int, nums))
plus = [0]*10000001
minus = [0]*10000001
result = []

for i in newCards:
    if i >= 0:
        plus[i] += 1
    else:
        minus[abs(i)] += 1

for i in newNums:
    if i >= 0:
        result.append(str(plus[i]))
    else:
        result.append(str(minus[abs(i)]))

output = " ".join(result)

print(output)