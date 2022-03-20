import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let department = d.sorted()
    var result = 0
    var sum = 0

    for de in department {
        sum += de
        if sum <= budget {

            result += 1
        }
    }
    
    return result
}