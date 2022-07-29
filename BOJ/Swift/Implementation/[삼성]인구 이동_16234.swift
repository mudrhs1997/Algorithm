import Foundation

let nlr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var country = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: nlr[0]), count: nlr[0])
var sum = 0
var cnt = 0
var x = [0,0,1,-1]
var y = [1,-1,0,0]
for _ in 0..<nlr[0] {
    country.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

func day(_ result: Int) -> Int {
    var check = false
    var count = 1
    for i in 0..<nlr[0] {
        for j in 0..<nlr[0] {
            if visited[i][j] == 0 {
                dfs(i,j,count)
                if cnt > 1 {
                    getMove(count)
                    check = true
                    count += 1
                }
                cnt = 0
                sum = 0
            }
        }
    }
    visited = Array(repeating: Array(repeating: 0, count: nlr[0]), count: nlr[0])
    
    if check {
        return day(result+1)
    } else {
        return result
    }
}

func dfs(_ countryX: Int, _ countryY: Int, _ c: Int)  {
    visited[countryX][countryY] = c
    sum += country[countryX][countryY]
    cnt += 1
    for i in 0..<4 {
        if countryX+x[i] < 0 || countryX+x[i] > nlr[0]-1 || countryY+y[i] < 0 || countryY+y[i] > nlr[0]-1 {
            continue
        }
        if visited[countryX+x[i]][countryY+y[i]] != 0 {
            continue
        }
        if abs(country[countryX][countryY] - country[countryX+x[i]][countryY+y[i]]) >= nlr[1] && abs(country[countryX][countryY] - country[countryX+x[i]][countryY+y[i]]) <= nlr[2]  {
            dfs(countryX+x[i], countryY+y[i], c)
        }
    }
    if cnt < 2 {
        visited[countryX][countryY] = 0
    }
}

func getMove(_ c: Int) {
    for i in 0..<nlr[0] {
        for j in 0..<nlr[0] {
            if visited[i][j] == c {
                country[i][j] = sum/cnt
            }
        }
    }
}

print(day(0))
