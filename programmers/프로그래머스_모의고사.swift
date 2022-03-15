import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let answer_sheet = [[1,2,3,4,5],[2,1,2,3,2,4,2,5],[3,3,1,1,2,2,4,4,5,5]]
    var math1 = [Int]()
    var math2 = [Int]()
    var math3 = [Int]()
    var math_result = [(1,0), (2,0), (3,0)]

    var result = [Int]()

    for i in 0..<answers.count {
        math1.append(answer_sheet[0][i%5])
        math2.append(answer_sheet[1][i%8])
        math3.append(answer_sheet[2][i%10])
    }

    for i in 0..<answers.count {

        if math1[i] == answers[i] {
            math_result[0].1 += 1
        }

        if math2[i] == answers[i] {
            math_result[1].1 += 1
        }

        if math3[i] == answers[i] {
            math_result[2].1 += 1
        }

    }

    var max = math_result[0].1

    for i in math_result {
        if max < i.1 {
            max = i.1
        }
    }

    for i in math_result {
        if i.1 == max {
            result.append(i.0)
        }
    }

    
    return result
}