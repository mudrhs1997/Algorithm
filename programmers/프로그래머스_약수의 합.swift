func solution(_ n:Int) -> Int {
    var result = 0
    for i in 0...n {
        if n.isMultiple(of: i) {
            result += i
        }
    }
    return result
}