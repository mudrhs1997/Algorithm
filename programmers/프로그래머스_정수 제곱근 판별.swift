import Foundation

//  sqrt라는 함수가 존재한다

let n: Int64 = 2
let i: Int64 = 7071067
var result: Int64 = 0
let rootN = n.isMultiple
print(rootN)
for k in 1...i {
    if pow(Double(n),0.5) == Double(k) {
        result = Int64(pow(Double(k+1),2))
        print(result)
        break
    }
}

if result == 0 {
    print(-1)
}
