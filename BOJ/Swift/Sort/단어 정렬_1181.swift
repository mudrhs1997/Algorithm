import Foundation

let n = Int(readLine()!)!
var arr = Set<String>()
for _ in 1...n {
    arr.insert(readLine()!)
}
func compare(_ a: String, _ b: String) -> Bool {
    if a.count < b.count {
        return true
    } else if a.count == b.count {
        return a<b
    } else {
        return false
    }
}
let result = arr.sorted{ compare($0, $1) }
for i in result {
    print(i)
}
