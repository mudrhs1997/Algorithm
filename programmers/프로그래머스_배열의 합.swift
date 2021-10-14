import Foundation

let arr1 = [[1,2],[2,3]]
let arr2 = [[3,4],[5,6]]
var result: [[Int]] = [[Int]]()



for i in 0..<arr1.count {
    var arr: [Int] = [Int]()
    for j in 0..<arr1[i].count {
        arr.append(arr1[i][j] + arr2[i][j])
    }
    result.append(arr)
}

print(result)

