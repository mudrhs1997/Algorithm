import Foundation

var arr: [[String]] = Array(repeating: [], count: 13)
let x: [Int] = [0,1,0,-1]
let y: [Int] = [1,0,-1,0]
var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: 6), count: 13)
var cnt: Int = 0
var visited: [(Int, Int)] = [(Int, Int)]()
var result = 0
var boom = true

for i in 1..<13 {
    arr[i] = Array(readLine()!).map{String($0)}
}

while boom {
    boom = false
    for i in 1..<arr.count {
        for j in 0..<arr[i].count {
            if arr[i][j] != "." {
                search(i,j)
                if cnt >= 4 {
                    for visit in visited {
                        arr[visit.0][visit.1] = "."
                        boom = true
                    }
                }
                visited = []
                visit = Array(repeating: Array(repeating: false, count: 6), count: 13)
                cnt = 0
            }
        }
    }
    for _ in 0..<12 {
        for i in 2..<arr.count {
            for j in 0..<arr[i].count {
                if arr[i][j] == "." {
                    if arr[i-1][j] != "." {
                        arr[i][j] = arr[i-1][j]
                        arr[i-1][j] = "."
                    }
                }
            }
        }
    }
    if boom == true {
        result += 1
    }
}


func search(_ num1: Int, _ num2: Int) {
    visit[num1][num2] = true
    let color = arr[num1][num2]
    visited.append((num1,num2))
    cnt += 1
    for i in 0..<4 {
        if 1 <= num1+x[i] && num1+x[i] < 13 && 0 <= num2+y[i] && num2+y[i] < 6 {
            if arr[num1+x[i]][num2+y[i]] == "." {
            } else {
                if visit[num1+x[i]][num2+y[i]] != true && arr[num1+x[i]][num2+y[i]] == color {
                    search(num1+x[i],num2+y[i])
                }
            }
        }
    }
}


print(result)

