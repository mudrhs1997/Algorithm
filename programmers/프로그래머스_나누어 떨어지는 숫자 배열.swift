func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result = [Int]()

    for a in arr {
        if a%divisor == 0 {
            result.append(a)
        }
    }

    if result.isEmpty {
        result.append(-1)
        return result
    } else {
        result.sort()
        return result
    }
}