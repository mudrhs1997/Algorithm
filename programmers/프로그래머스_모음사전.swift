// 코드 맘에 안듦

import Foundation

var alph = ["A","E","I","O","U"]
var check = [String]()
var count = 0
var chk = false

func solution(_ word:String) -> Int {
    dfs(1,word)
    return count
}

func dfs(_ cnt: Int, _ target: String) {
    if cnt > 5 {
        return
    }
    if chk {
        return
    }
    for word in alph {
        count += 1
        check += [word]
        if check.joined() == target {
            chk = true
            return
        }
        dfs(cnt+1,target)
        if chk {
            return
        }
        check.removeLast()
        
    }
}