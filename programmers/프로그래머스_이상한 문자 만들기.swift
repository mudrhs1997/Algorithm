import Foundation

func solution(_ s:String) -> String {
    var cnt = 1
    var arr = Array(s)
    var result = [String]()
    for i in 0...arr.count-1 {
        if cnt % 2 == 0 && arr[i] != " "{
            result.append(arr[i].lowercased())
            cnt += 1
        } else if cnt % 2 == 1 && arr[i] != " "{
            result.append(arr[i].uppercased())
            cnt += 1
        } else if arr[i] == " " {
            result.append(" ")
            cnt = 1
        }
    }
    return result.joined()
}