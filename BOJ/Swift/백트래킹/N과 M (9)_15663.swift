import Foundation

// String 정렬에 대해서 다시 공부해볼것.

let NM = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let num = readLine()!.components(separatedBy: " ").map{ String($0) }.sorted { Int($0)!<Int($1)! }

var visit = Array(repeating: false, count: NM[0])
var result = [String]()
var results = Set<String>()


func makeSeq(_ cnt: Int) {
    for i in num.indices {
        if cnt == NM[1] {
            if visit[i] == false {
                result.append(num[i])
                results.insert(result.joined(separator: " "))
                result.removeLast()
            }
        } else {
            if visit[i] {
                continue
            }
            visit[i] = true
            result.append(num[i])
            makeSeq(cnt + 1)
            result.removeLast()
            visit[i] = false
            }
        
    }
}


makeSeq(1)

let newResult = results.sorted(by: {
    $0.localizedStandardCompare($1) == .orderedAscending
})

for i in newResult {
    print(i)
}
