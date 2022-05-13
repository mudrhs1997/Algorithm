import Foundation

// 위지가 도와줌, 지린다 너 (dp의 기본 틀)

/**
 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.

 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.
 */

let N = Int(readLine()!)!
let INF = 0x3f3f3f3f

var memo = Array(repeating: INF, count: N+1)

func makeOne(_ num: Int) -> Int {
    if memo[num] != INF {
        return memo[num]
    }
    if num == 1 {
        memo[num] = 0
        return memo[num]
    }
    
    if num % 3 == 0 {
        memo[num] = min(memo[num], makeOne(num/3) + 1)
    }
    if num % 2 == 0 {
        memo[num] = min(memo[num], makeOne(num/2) + 1)
    }
    
    memo[num] = min(memo[num], makeOne(num-1) + 1)
    
    return memo[num]
}

print(makeOne(N))


