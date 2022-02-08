func solution(_ strings:[String], _ n:Int) -> [String] {
    
    func findIndex(str : String) -> String {
        let stIndex = str.index(str.startIndex, offsetBy: n)
        return String(str[stIndex])
    }
    
    var desc = strings.sorted()
    
    var result = desc.sorted {s1, s2 in 
            findIndex(str: s1) < findIndex(str: s2) 
                            }
    
    return result
}