import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var rec = [Int]()
    for i in 1...yellow {
        if yellow % i != 0 {
            continue
        }
        rec = [yellow/i,i]
        if (rec[0]+2)*2+rec[1]*2 == brown {
            break
        }
        
    }

    return [rec[0]+2,rec[1]+2]
}


