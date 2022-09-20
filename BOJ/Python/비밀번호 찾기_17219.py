n, m = map(int, input().split())
pw = {}
for i in range(0,n) :
        ipt = list(map(str,input().split()))
        pw[ipt[0]] = ipt[1]

for i in range(0,m) :
        print(pw[input()])
