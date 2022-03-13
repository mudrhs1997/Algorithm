

func solution(_ s:String) -> String {
    
    var result = ""
    
    if s.count % 2 != 0 {
        let index = s.index(s.startIndex, offsetBy: s.count/2)
        result = String(s[index])
        
        return result
    } else {
        var index = s.index(s.startIndex, offsetBy: s.count/2 - 1)
        result += String(s[index])
        index = s.index(s.startIndex, offsetBy: s.count/2)
        result += String(s[index])
        
        return result
    }
}