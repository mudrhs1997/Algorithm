import Foundation

let NM = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let num = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted { $0<$1 }

var visit = Array(repeating: false, count: NM[0])


func makeSeq(_ cnt: Int, _ result: String, _ idx: Int) {
    for i in idx...num.count-1 {
        if cnt == NM[1] {
                print(result + String(num[i]))
        } else {
                makeSeq(cnt + 1, result+String(num[i])+" ", i)
        }
    }
}

makeSeq(1, "", 0)
