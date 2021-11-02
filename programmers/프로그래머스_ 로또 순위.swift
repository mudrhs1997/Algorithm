import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var score = 0
    var erased = 0
    var result = [Int]()
    var ans = [Int]()

    for i in lottos {
        if i == 0 { erased += 1 }
        else {
            for j in win_nums {
                if i == j{
                    score += 1
                }
            }
        }
    }

    result.append(score+erased)
    result.append(score)

    for i in result {
        if i == 6 {
            ans.append(1)
        } else if i == 5 {
            ans.append(2)
        } else if i == 4 {
            ans.append(3)
        } else if i == 3 {
            ans.append(4)
        } else if i == 2 {
            ans.append(5)
        } else {
            ans.append(6)
        }
    }

    return ans
}