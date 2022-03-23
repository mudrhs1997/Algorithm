import Foundation

var num = 0
var result = 0
var number = [Int]()


func getResult(index: Int, last: Int, targetNumber: Int) {
    if index == last {
        for i in 1...2 {
            if i == 1 {
                num += number[index]
                if num == targetNumber {
                    result += 1
                }
                num -= number[index]
            } else {
                num -= number[index]
                if num == targetNumber {
                    result += 1
                }
                num += number[index]
            }
        }
    } else {
        for i in 1...2 {
            if i == 1 {
                num += number[index]
                getResult(index: index+1, last: last, targetNumber: targetNumber)
                num -= number[index]
            } else {
                num -= number[index]
                getResult(index: index+1, last: last, targetNumber: targetNumber)
                num += number[index]
            }
        }
    }
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    number = numbers

    
    getResult(index: 0, last: number.count-1, targetNumber: target)
    
    return result
}