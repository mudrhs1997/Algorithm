import Foundation

var cnt = 0

func solution(_ s:String) -> Int {
    cnt = s.count
    var result = 0
    var arr = Array(s)
    if cnt % 2 == 1 {
        return 0
    }
    for i in 0..<cnt {
        if check(arr,i) == true {
            result += 1
        }
        arr += [arr[i]]
    }
    
    return result
}

func check(_ s: [Character], _ idx: Int) -> Bool {
    var bracket = [Character]()
    for i in idx..<cnt+idx {
        switch s[i] {
            case "(": bracket += "("
            case "[": bracket += "["
            case "{": bracket += "{"
            case ")": if bracket.last != "(" { return false } else { bracket.removeLast() }
            case "]": if bracket.last != "[" { return false } else { bracket.removeLast() }
            case "}": if bracket.last != "{" { return false } else { bracket.removeLast() }
            default: return true
        }
    }
    if bracket.isEmpty {
        return true
    } 
    return false
}
