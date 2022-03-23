import Foundation

//  다시 풀어볼 것
func solution(_ land:[[Int]]) -> Int{
    var index = -1
    var lands = land

    for i in 1..<lands.count {
        for j in 0..<4 {
            var max = 0
            for k in 0..<4 {
                if k != j {
                    if max < lands[i-1][k] {
                        max = lands[i-1][k]
                    }
                }
            }
            lands[i][j] += max
        }
    }

    return lands[lands.count-1].max()!
}