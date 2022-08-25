// 내 코드.. 맞았다고 믿고 싶지만 아무리 제출해도 맞지 않는다 다른 사람 코드랑 다른 점이 없는데..

func solution(_ files:[String]) -> [String] {
    var file = [(String, Int, Int)]()
    var result = [String]()
    var sortedFile = [Int]()
    var head = ""
    var number = ""
    var check = false
    var num = 0
    var cnt = 0

    for f in files {
        for c in f {
            if c.isNumber && cnt < 5 {
                check = true
                number += String(c)
                cnt += 1
                continue
            }
            if check && (cnt == 5 || c.isLetter) {
                break
            }
            head += String(c)
        }
        file += [(head.uppercased(), Int(number)!, num)]
        num += 1
        number = ""
        head = ""
        cnt = 0
        check = false
    }
    sortedFile = file.sorted(by: {
        if $0.0 != $1.0 { return $0.0 < $1.0 }
        if $0.1 != $1.1 { return $0.1 < $1.1 }
        return $0.2 < $1.2
    }).map {$0.2}
    
    
    for i in sortedFile {
        result += [files[i]]
    }


    return result
}

// 다른 사람의 풀이

extension String{
    var numeric: ClosedRange<Character> { return "0"..."9" }
    var head: String{
        return self.prefix { numeric.contains($0) == false }.uppercased()
    }
    var number: Int {
        return Int( self.drop   { numeric.contains($0) == false}
                        .prefix { numeric.contains($0) == true })!
    }
}

func solution(_ files:[String]) -> [String] {

    return files.enumerated().sorted { (lhs, rhs) in
        let l = lhs.element
        let r = rhs.element
        if l.head != r.head { return l.head < r.head}
        if l.number != r.number { return l.number < r.number}
        return lhs.offset < rhs.offset

    }.map{ $0.element }
}




