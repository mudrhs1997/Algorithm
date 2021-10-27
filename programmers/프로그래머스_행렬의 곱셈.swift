import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    var sum = 0

    for k in 0..<arr2[0].count {
        for i in 0..<arr1.count {
            for j in 0..<arr1[i].count {
                sum += arr1[i][j] * arr2[j][k]
            }
            result[i][k] = sum
            sum = 0
        }
    }
    return result
}