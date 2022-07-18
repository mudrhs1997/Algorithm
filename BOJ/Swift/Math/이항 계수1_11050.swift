import Foundation

let nk = readLine()!.components(separatedBy: " ").map{ Int($0)! }

func factorial(_ num: Int) -> Int {
    if num == 1 || num == 0{
        return 1
    } else {
        return num * factorial(num-1)
    }
}

print(factorial(nk[0])/(factorial(nk[1])*factorial(nk[0]-nk[1])))
