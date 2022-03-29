import Foundation

var count = 0
var index = -1
var result = ""

func make(s: String) -> String{
    var problem = s
    var st = ""
    index = -1
    if !check(s: s) {
        for i in s {
            
            index += 1
            
            if i == "(" {
                count -= 1
                st += String(i)
            } else {
                count += 1
                st += String(i)
            }
            
            if count == 0 {
                
                if check(s: st) {
                    
                    let cutIndex = problem.startIndex...problem.index(problem.startIndex, offsetBy: index)
                    problem.removeSubrange(cutIndex)
                    
                    return "\(st)\(make(s: problem))"
                } else {
                    
                    let cutIndex = problem.startIndex...problem.index(problem.startIndex, offsetBy: index)
                    problem.removeSubrange(cutIndex)
                    
                    st.removeFirst()
                    st.removeLast()
                    var fixed = ""
                    for i in st {
                        if i == "(" {
                            fixed += ")"
                        } else {
                            fixed += "("
                        }
                    }
                    return "(\(make(s: problem)))\(fixed)"
                    
                }
                
            }
        }
        return result
    } else {
        return s
    }
}

func check(s: String) -> Bool {
    var checkArr = [Character]()
    for i in s {
        if checkArr.last == "(" && i == ")" {
            checkArr.removeLast()
        } else {
            checkArr.append(i)
        }
    }
    if checkArr.isEmpty {
        return true
    } else {
        return false
    }
        
}

func solution(_ p:String) -> String {
    
    
    return make(s: p)
}