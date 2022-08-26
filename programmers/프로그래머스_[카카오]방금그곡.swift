import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var music = [(Int, String)]()
    for sic in musicinfos {
        let info = sic.split(separator: ",").map{String($0)}
        let timeLength = time(info[0],info[1])
        let code = transCode(info[3])
        let neo = transCode(m)
        let codeArr = Array(code).map{String($0)}
        let codeLength = code.count
        var memo = ""
        for i in 0..<timeLength {
            let idx = i%codeLength
            memo += codeArr[idx]
        }
        
        if memo.contains(neo) {
            music += [(timeLength,info[2])]
        }

    }
    music = music.sorted(by: {$0.0>$1.0})
    if music.isEmpty {
        return "(None)"
    }
    return music[0].1
}

func time(_ start: String, _ end: String) -> Int {
    let startTime = start.split(separator: ":").map{Int($0)!}
    let endTime = end.split(separator: ":").map{Int($0)!}
    return (endTime[0]-startTime[0])*60+(endTime[1]-startTime[1])
}

func transCode(_ code: String) -> String {
    var str = ""
    for i in code.indices { 
        if code[i] == "#" {
                let letter = str.removeLast()
                switch letter {
                    case "A": str += "1"
                    case "C": str += "2"
                    case "D": str += "3"
                    case "F": str += "4"
                    case "G": str += "5"
                    default: str += "0"
                }
                continue
            }
        str += String(code[i])
       }
    return str
}