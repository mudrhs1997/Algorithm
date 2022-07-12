import Foundation

let NM = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let num = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted { $0<$1 }

var visit = Array(repeating: false, count: NM[0])


func makeSeq(_ cnt: Int, _ result: String, _ idx: Int) {
    for i in idx...num.count-NM[1]+cnt-1 {
        if cnt == NM[1] {
            if visit[i] == false {
                print(result + String(num[i]))
            }
        } else {
            if visit[i] == false {
                visit[i] = true
                makeSeq(cnt + 1, result+String(num[i])+" ", i+1)
                visit[i] = false
            }
        }
    }
}

makeSeq(1, "", 0)
