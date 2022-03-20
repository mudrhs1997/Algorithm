import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0

    for num in left...right {
        var numOfMeasure = 0

        for isMeasure in 1...num {
            if num % isMeasure == 0 {
                numOfMeasure += 1
            }
        }

        if numOfMeasure % 2 == 0 {
            result += num
        } else {
            result -= num
        }
    }

    return result
}