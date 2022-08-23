import Foundation

var procession = [[Int]]()

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var cnt = 1
    var result = [Int]()
    procession = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    for i in procession.indices {
        for j in procession[i].indices {
            procession[i][j] = cnt
            cnt += 1
        }
    }
    
    for query in queries {
        result += [turn(query.map{$0-1})]
    }
    return result
}

func turn(_ points: [Int]) -> Int {
    var tmp = [Int]()
    var idx = 0
    for i in points[1]...points[3] {
        tmp += [procession[points[0]][i]]
        if i == points[1] {
            continue
        }
        procession[points[0]][i] = tmp[idx]
        idx += 1
    }
    for i in points[0]+1...points[2] {
        tmp += [procession[i][points[3]]]
        procession[i][points[3]] = tmp[idx]
        idx += 1
    }
    for i in (points[1]...points[3]-1).reversed() {
        tmp += [procession[points[2]][i]]
        procession[points[2]][i] = tmp[idx]
        idx += 1
    }
    for i in (points[0]...points[2]-1).reversed() {
        tmp += [procession[i][points[1]]]
        procession[i][points[1]] = tmp[idx]
        idx += 1
    }
    return tmp.min()!
}