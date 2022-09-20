import  sys

n = int(sys.stdin.readline())
union = set()

for i in range(n):
    call = list(map(str, sys.stdin.readline().split()))
    if call[0] == "check":
        if int(call[1]) in union:
            print(1)
        else:
            print(0)
        continue

    if call[0] == "add":
        union.add(int(call[1]))
        continue

    if call[0] == "remove":
        if int(call[1]) in union:
            union.discard(int(call[1]))
        continue

    if call[0] == "toggle":
        if int(call[1]) in union:
            union.discard(int(call[1]))
        else:
            union.add(int(call[1]))
        continue

    if call[0] == "all":
        union = set(range(1,21))
        continue

    if call[0] == "empty":
        union.clear()
        continue
