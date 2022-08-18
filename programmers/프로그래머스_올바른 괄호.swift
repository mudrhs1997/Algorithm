import Foundation

func solution(_ s:String) -> Bool {
    var cnt = 0
    
    if s.count % 2 == 1 {
        return false
    }
    
    for bracket in s {
        if cnt == 0 {
            if bracket == ")" {
                return false
            }
            cnt += 1
            continue   
        }
        if bracket == "(" {
            cnt += 1
            continue
        }
        if bracket == ")" {
            cnt -= 1  
        }
    }
    
    return cnt == 0 ? true : false
}