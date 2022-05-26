import Foundation


var ryan_Score = [[Int]]()

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    var max = 0
    
    var result = [[Int]]()
    
    
    scored(n, Array(repeating: 0, count: 11), 0)
    
    
    for score in ryan_Score {
        var ryan = 0
        var peach = 0
        for i in info.indices {
            if score[i] != 0 || info[i] != 0 {
                if score[i] <= info[i] {
                    peach += 10-i
                } else {
                    ryan += 10-i
                }
            }
        }
        if max < (ryan - peach) {
            max = ryan - peach
        }
    }
    
    for score in ryan_Score {
        var ryan = 0
        var peach = 0
        for i in info.indices {
            if score[i] != 0 || info[i] != 0 {
                if score[i] <= info[i] {
                    peach += 10-i
                } else {
                    ryan += 10-i
                }
            }
        }
        if ryan - peach == max {
            result.append(score)
        }
        
    }
    
    var answer = Array(repeating: 0, count: 11)
    
    for j in result {
        for i in (0..<answer.count).reversed() {
            if answer[i] < j[i] {
                answer = j
                continue
            } else if answer[i] > j[i] {
                break
            }
        }
    }

    
    if result.isEmpty || max == 0 {
        return [-1]
    } else {
        return answer
    }
}

func scored(_ n: Int, _ info: [Int], _ cnt: Int) {
    if cnt == 10
    
    for i in 0...n {
        let shot = n-i
        var ryan = info
        if cnt == 10 {
            ryan[cnt] = shot
            ryan_Score.append(ryan)
            if shot == n {
                break
            }
        } else {
            ryan[cnt] = i
            scored(shot, ryan, cnt+1)
        }
    }
}


