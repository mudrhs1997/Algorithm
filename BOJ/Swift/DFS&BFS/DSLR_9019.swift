import Foundation

let t = Int(String(readLine()!))!
var memo = [Int]()
var answer = [Int]()
var DSLR = [1,2,3,4]
var check = false
var idx = 0
var visited = Array(repeating: false, count: 10001)
for _ in 0..<t {
    let cases = readLine()!.split(separator: " ").map{Int(String($0))!}
    check = false
    visited = Array(repeating: false, count: 10001)
    memo = [cases[0]]
    answer = [0]
    idx = 0
    while !check {
        for dslr in DSLR {
            let nextValue = trans(dslr,memo[idx])
            if !visited[nextValue] {
                visited[nextValue] = true
                memo += [nextValue]
                answer += [answer[idx]*10+dslr]
            }
            if memo.last == cases[1] {
                var result = answer.last!
                let strings = ["","D","S","L","R"]
                var r = ""
                while result > 0 {
                    r = strings[result%10]+r
                    result /= 10
                }
                print(r)
                check = true
                break
            }
        }
        visited[memo[idx]] = true
        idx += 1
    }
}

func trans(_ c: Int, _ n: Int) -> Int {
    switch c {
    case 1:
        return (n*2)%10000
    case 2:
        return n-1 < 0 ? 9999 : n-1
    case 3:
        return (n%1000)*10+(n/1000)
    case 4:
        return (n/10)+1000*(n%10)
       
    default:
        return 0
    }
}
