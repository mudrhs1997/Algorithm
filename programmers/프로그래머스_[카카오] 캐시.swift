func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var arr = Array(repeating: "", count: cacheSize)
    var check = false
    var idx = 0
    var cnt = 0
    if cacheSize == 0 {
        return cities.count*5
    }
    for c in cities {
        check = false
        let city = c.uppercased()
        for i in idx..<idx+cacheSize {
            if arr[i] == city {
                arr += [arr.remove(at:i)]
                cnt += 1
                check = true
                break
            }
        }
        if !check {
            arr += [city]
            cnt += 5
            idx += 1
            continue
        }
    }
    return cnt
}