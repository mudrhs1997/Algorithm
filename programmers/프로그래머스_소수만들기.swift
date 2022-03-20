import Foundation

func solution(_ nums:[Int]) -> Int {
    var result = 0

    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                let num = nums[i]+nums[j]+nums[k]

                var isDecimal = 0

                for i in 1...Int(floor(sqrt(Double(num)))) {
                    if num%i == 0 {
                        isDecimal += 1
                    }
                }

                if isDecimal == 1 {
                    result += 1
                }
            }
        }
    }


    return result
}