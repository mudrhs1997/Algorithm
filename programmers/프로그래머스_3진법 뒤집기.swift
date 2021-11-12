import Foundation

func solution(_ n:Int) -> Int {
    var transform = String(String(n,radix: 3).reversed())
    var third = transform
    var result = 0
    for i in 0..<transform.count {
        var num = third.removeLast()
        var toBin = Int(pow(3,Double(i)))
        result += toBin*Int(String(num))!
    }
    return result
}