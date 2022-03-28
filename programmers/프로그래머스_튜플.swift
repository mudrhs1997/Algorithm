import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    var separateString = [[Int]]()

    var arr1 = [Set<Int>]()
    var arr2 = Set<Int>()
    var isOpen = true
    var num = ""

    for i in s {
        if i == "{" {
            isOpen = true
            arr2 = []
        } else if i.isNumber {
            num += String(i)
        } else if i == "," {
            if isOpen {
                arr2.insert(Int(num)!)
                num = ""
            }
        } else if i == "}" {
            if isOpen {
                arr2.insert(Int(num)!)
                arr1.append(arr2)
                isOpen = false
                num = ""
            }
        }
    }

    var sortedArr = arr1.sorted{$0.count < $1.count}
    result.append(sortedArr[0].first!)

    for i in 0..<sortedArr.count-1 {
        let a = sortedArr[i]
        let b = sortedArr[i+1]
        let c = b.subtracting(a)
        result.append(c.first!)
    }

    return result
}