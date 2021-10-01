import Foundation

var f = [6,2,8,4]
var arr = f.sorted()

while(arr.count != 1) {
    let a = arr.removeFirst()
    let b = arr.removeFirst()
    let result = a * b / gcd(a, b)
    arr.insert(result, at: 0)
}



func gcd(_ a: Int, _ b: Int) -> Int {
    if a == 0 { return b }
    else {
        return gcd(b%a, a)
    }
}

