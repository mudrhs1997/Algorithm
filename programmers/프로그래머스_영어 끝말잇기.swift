import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var memo = [String]()
    var char: Character = words[0].first!
    var num = 0
    var count = 0
    for word in words {
        if num == 0 {
            count += 1
        }
        if memo.contains(word) || char != word.first! {
            return [num+1,count]

        }
        memo += [word]
        char = word.last!
        
        num = (num+1)%n
    }
    return [0,0]
}