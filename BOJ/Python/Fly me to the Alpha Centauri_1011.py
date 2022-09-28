from sys import stdin

T=int(stdin.readline().strip()) #테스트 케이스 개수 받기

for i in range(T): #테스트 케이스 만큼 계산해주기
    x, y = stdin.readline().split() #시작과 도착 거리 받기

    distance=int(y)-int(x) #거리 구하기

    space=0 #공간이동 장치 작동 횟수
    k=0 #space 중 어디에 속하는지 알기 위한 최대 거리
    a=0.5 #거리가 두 번에 걸쳐 1씩 늘어나기 때문

    while distance > k: #거리가 최대거리보다 작아지는 순간의 space를 구하기 위함
        a=a+0.5
        k=k+int(a)
        space=space+1

    print(space)