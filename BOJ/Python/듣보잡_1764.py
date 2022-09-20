n, m = map(int, input().split())
listen = set([])
see = set([])
for i in range(0,n) :
        listen.add(input())

for i in range(0,m) :
        see.add(input())

result = sorted(list(listen.intersection(see)))
print(len(result))
for i in result:
        print(i)