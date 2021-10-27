func solution(_ s:String) -> String {
    var arr = s.components(separatedBy: " ").map { Int($0)! }
    var result = [String]()
    result.append(String(arr.min()!))
    result.append(String(arr.max()!))
    
    return result.joined(separator: " ")
}