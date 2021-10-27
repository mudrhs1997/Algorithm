func solution(_ n:Int) -> Int {
    var result = [Int64]()
    
    for i in 0...n {
        if i == 0 { result.append(0) }
        else if i == 1 { result.append(1) }
        else {
            result.append((result[i-1]+result[i-2])%1234567)
        }
    }
    
    return Int(result[n])
}