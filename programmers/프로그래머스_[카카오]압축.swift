var m = [String]()
var dic = [String: Int]()
var search = ""

func solution(_ msg:String) -> [Int] {
    m = Array(msg).map{String($0)}
    var answer = [Int]()
    var idx = 0
    var num = 27
    let msgLength = msg.count
    while idx < msgLength {
        search = m[idx]
        let add = check(m[idx], idx, msgLength)
        if search == add {
            if search.count == 1 {
                answer += [Int(Character(m[idx]).asciiValue!-64)]
                break
            }
            answer += [dic[search]!]
            break
        }
        if search.count == 1 {
            answer += [Int(Character(m[idx]).asciiValue!-64)]
        } else {
            answer += [dic[search]!]
        }
        dic[add] = num
        num += 1
        idx += search.count
    }
    return answer
}

func check(_ str: String, _ idx: Int, _ length: Int) -> String {
    if idx == length-1 && dic.contains(where: {$0.key == str}) {
        search = str
        return str
    }
    if idx == length-1 || (!dic.contains(where:{$0.key == str}) && str.count != 1)  {
        return str
    }
    search = str
    return check(str+m[idx+1], idx+1, length)
}