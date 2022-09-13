import Foundation

var category = [String: Int]()
var memo = [[String]]()

func solution(_ clothes:[[String]]) -> Int {
    var idx = 0
    var result = 1
    
    for c in clothes {
        if category.contains(where: { $0.key == c[1] }) {
            memo[category[c[1]]!] += [c[0]]
            continue
        }
        memo += [["",c[0]]]
        category[c[1]] = idx
        
        idx += 1
    }
    
    for i in memo {
        result *= i.count
    }
    
    return result-1
}