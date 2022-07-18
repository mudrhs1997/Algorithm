import Foundation

let n = Int(String(readLine()!))!
var arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var result = 0

func isPrime(_ num: Int) -> Bool{
    if num == 1 {
        return false
    } else if num == 2 {
        return true
    }
    
    for j in 2...num-1 {
        if num % j == 0 {
            return false
        }
    }
    
    return true
}

for i in arr {
    if isPrime(i) == true {
        result += 1
    }
}

print(result)
