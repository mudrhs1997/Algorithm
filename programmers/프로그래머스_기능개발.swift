import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progress = progresses
    var speed = speeds
    var result = [Int]()

    while !progress.isEmpty {
        var complete = 0
        for i in 0..<progress.count {
            if progress[i] < 100 {
                progress[i] += speed[i]
            }
        }
        while progress.first ?? 0 >= 100 {
            complete += 1
            progress.removeFirst()
            speed.removeFirst()
        }
        if complete != 0 {
            result.append(complete)
        }
    }
    
    return result
}