import Foundation

var escape = true

while escape {
    var num = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted()
    if num[0] == 0 {
        escape = false
        break
    } else if pow(Decimal(num[0]), 2)+pow(Decimal(num[1]), 2) == pow(Decimal(num[2]), 2) {
        print("right")
    } else {
        print("wrong")
    }
    
}
