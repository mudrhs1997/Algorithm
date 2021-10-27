import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var arr1 = A.sorted()
    var arr2 = B.sorted()
    var result = 0

    for _ in 0..<A.count {
        result += arr1.removeFirst() * arr2.removeLast()
    }

    return result
}