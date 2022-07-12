import Foundation

let NM = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let num = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let visited = Array(repeating: false, count: NM[0])
let sortedNum = num.sorted()


func makeSeq(_ cnt: Int, _ visit: [Bool], _ result: String) {
    for i in sortedNum.indices {
        if cnt == NM[1] {
            if visit[i] == false {
                print(result + String(sortedNum[i]))
            }
        } else {
            if visit[i] == false {
                var v = visit
                v[i] = true
                makeSeq(cnt+1, v, result+String(sortedNum[i])+" ")
            }
        }
    }
}

makeSeq(1, visited, "")
