import Foundation

func solution(_ dartResult:String) -> Int {
    var index = -1
    var isTen = false
    var result = [Int]()

    for i in dartResult {
        if i.isNumber {
            let num = Int(String(i))!
            if num == 1 {
                result.append(num)
                isTen = true
                index += 1
            } else if num == 0 && isTen {
                result[index] = 10
                isTen = false
            } else {
                result.append(Int(String(i))!)
                index += 1
                isTen = false
            }
        } else if i.isLetter {
            if i == "D" {
                result[index] *= result[index]
            } else if i == "T" {
                result[index] *= result[index] * result[index]
            }
        } else {
            if i == "#" {
                result[index] = -result[index]
            } else {
                if index == 0 {
                    result[index] *= 2
                } else {
                    result[index] *= 2
                    result[index-1] *= 2
                }
            }
        }
    }


    return result.reduce(0, {$0+$1})
}