import Foundation

let num = 626331
var cnt = 0

func Collatz(_ num :Int) {
    if (cnt > 500) {
        cnt = -1
        return
    }
    if (num == 1) {
        return
    }
    cnt += 1
    if (num % 2 == 0) {
        let result = num / 2
        Collatz(result)
    }
    if (num % 2 == 1) {
        let result = num * 3 + 1
        Collatz(result)
    }
}

Collatz(num)
print(cnt)
