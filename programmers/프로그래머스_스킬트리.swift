import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let sequence = Array(skill)
    let cnt = sequence.count
    var idx = 0
    var result = [Bool]()
    for tree in skill_trees {
        var check = true
        for skill in tree {
            if !sequence.contains(skill) {
                continue
            }
            if sequence[idx] != skill {
                check = false
                break
            }
            if idx == cnt-1 {
                break
            }
            idx += 1
        }
        check ? result.append(true) : result.append(false)
        idx = 0
    }
    return result.filter{$0==true}.count
}