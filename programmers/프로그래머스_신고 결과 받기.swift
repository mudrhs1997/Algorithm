import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = [Int](repeating: 0, count: id_list.count)
    var reported = [Set<String>](repeating: Set<String>(), count: id_list.count)

    for r in report {
        let split = r.components(separatedBy: " ")
        for i in 0..<id_list.count {
            if split[1] == id_list[i] {
                reported[i].insert(split[0])
            }
        }
    }

    for r in reported {
        if r.count >= k {
            for i in r {
                for index in 0..<id_list.count {
                    if i == id_list[index] {
                        result[index] += 1
                    }
                }
            }
        }
    }
    
    return result
}