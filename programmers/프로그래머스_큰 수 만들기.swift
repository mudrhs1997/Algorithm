import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numbers = Array(number).map{String($0)}
    var cnt = 0
    var answer = [String]()
    for i in 0..<numbers.count {
        if answer.isEmpty {
            answer += [numbers[i]]
            continue
        }
        if cnt < k {
            while answer.last! < numbers[i] {
                answer.removeLast()
                cnt += 1
                if answer.isEmpty {
                    break
                }
                if cnt == k {
                    break
                }
            }
        }
        
        
        answer += [numbers[i]]
    }
    if cnt < k {
        for i in 0..<k-cnt {
            answer.removeLast()
            cnt = k
        }
    }

    
    
    return answer.joined()
}
