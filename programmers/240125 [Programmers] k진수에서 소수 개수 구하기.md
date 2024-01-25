---
title: '240125 [Programmers] k진수에서 소수 개수 구하기'
created: '2024-01-25T06:32:02.770Z'
modified: '2024-01-25T06:32:52.401Z'
---

# 240125 [Programmers] k진수에서 소수 개수 구하기
```python
def solution(n, k):
    answer = 0
    transedNumber = transform(n, k)
    currentNumber = 0
    for number in reversed(transedNumber):
        if number == 0:
            if isPrime(currentNumber):
                answer += 1
            currentNumber = 0
        currentNumber = currentNumber * 10 + number
    return answer

def transform(n, unit):
    decimal = [0]
    while n > 0:
        decimal.append(n%unit)
        n //= unit
    return decimal

def isPrime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5)+1):
        if num % i == 0:
            return False
        
    return True
```
