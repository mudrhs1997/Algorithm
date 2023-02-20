def solution(s):
    arr = list(s)
    answer = 0
    cnt = 1
    
    if len(arr) == 1:
        return cnt

    for i in range(0, len(arr)-1):
        if arr[i] == arr[i+1]:
            cnt += 1
            length = 1
            while 1:
                if 0<= i-length and i+length+1 < len(arr):
                    if arr[i-length] == arr[i+length+1]:
                        cnt += 2
                        length += 1
                    else:
                        answer = max(answer, cnt)
                        cnt = 1
                        break
                else:
                    answer = max(answer, cnt)
                    cnt = 1
                    break
                    
        if arr[i-1] == arr[i+1]:
            length = 1
            while 1:
                if 0 <= i-length and i+length < len(arr):
                    if arr[i-length] == arr[i+length]:
                        cnt += 2
                        length += 1
                    else:
                        answer = max(answer, cnt)
                        cnt = 1
                        break
                else:
                    answer = max(answer, cnt)
                    cnt = 1
                    break
            
    return answer