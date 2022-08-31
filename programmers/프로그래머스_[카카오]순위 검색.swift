// 내 풀이
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var language = Array(repeating:Array(repeating: [Int](), count: 16), count: 3)
   
    var result = [Int]()
    for information in info {
        let dev = information.split(separator: " ").map{ String($0) }
        var idx = 1
        var lang = 0
        for d in dev {
            switch d {
                case "cpp": lang = 0
                case "java": lang = 1
                case "python": lang = 2
                case "backend", "junior", "chicken": idx *= 2
                case "frontend", "senior", "pizza": idx = idx*2 + 1
                default: continue
            }
        }
        language[lang][idx] += [Int(dev[4])!]
        idx = 1
        lang = 0
    }
    
    for q in query {
        let condition = q.split(separator: " ").map{ String($0) }.filter{ $0 != "and"}
        var idx = [1]
        var answer = [Int]()
        var cnt = 0
        var l = 3
        
        switch condition[0] {
        case "cpp": l = 0
        case "java": l = 1
        case "python": l = 2
        default: l = 3
        }
        
        for con in 1..<condition.count {
            let count = idx.count
            if condition[con] == "-" {
                for i in cnt..<count {
                    idx += [idx[i]*2, idx[i]*2+1]
                    cnt = i+1
                }
            } else if condition[con] == "backend" || condition[con] == "junior" || condition[con] == "chicken" {
                for i in cnt..<count {
                    idx += [idx[i]*2]
                     cnt = i+1
                }
            } else if condition[con] == "frontend" || condition[con] == "senior" || condition[con] == "pizza" {
                for i in cnt..<count {
                    idx += [idx[i]*2+1]
                    cnt = i+1
                }
            }
        }
        if l == 3 {
            for i in cnt..<idx.count {
                answer += language[0][idx[i]]
                answer += language[1][idx[i]]
                answer += language[2][idx[i]]
            }
        } else {
            for i in cnt..<idx.count {
                answer += language[l][idx[i]]
            }
        }
        answer = answer.sorted()
        var low = 0
        var high = answer.count - 1
        var mid = 0
        
        while low <= high {
            mid = (low + high) / 2
            if answer[mid] < Int(condition.last!)! {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        result += [answer.count-low]
        answer = []
    }
    
    
    
    return result
}


// 답지
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    // 문자열 요소를 배열로!
    var info = info.map {$0.replacingOccurrences(of: " and", with: "").components(separatedBy: " ")}
    // db를 딕셔너리로
    var db = [String:[Int]]()
    // 결과
    var ans = [Int]()
    
    // db 구성
    for data in info {
        let lang = [data[0],"-"]
        let dev = [data[1],"-"]
        let lev = [data[2],"-"]
        let food = [data[3],"-"]
        let score = Int(data[4])!
        
        // 모든 케이스를 key value로 저장 
        for l in lang {
            for d in dev {
                for v in lev {
                    for f in food {
                        var datas = "\(l)\(d)\(v)\(f)"
                        if let _ = db[datas] {
                            db[datas]!.append(score)
                        } else {
                            db[datas] = [score]
                        }
                    }
                }
            }
        }
    }
    
    // value를 기준으로 오름차순 정렬 
    for d in db {
        let val = d.value.sorted {$0 < $1}
        db[d.key] = val
    }
    
    // 쿼리를 돌면서
    for q in query {
        // 우선 문자열 전처리
        var t = q.replacingOccurrences(of:" and", with:"").components(separatedBy: " ")
        // key 설정
        var k = "\(t[0])\(t[1])\(t[2])\(t[3])"
        // 점수
        var score = Int(t[4])!
        
        // 키에 대응되는 score 배열
        if let val = db[k] {
            // 이분탐색
            var left = 0 
            var right = val.count - 1 
            var mid = 0
            
            while left <= right {
                mid = (left + right) / 2
                
                if val[mid] < score {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            // left 이후는 기준 score 이상의 점수들임!
            ans.append(val.count - left)
            
        } else {
            // db에 key가 없을 때 
            ans.append(0)
        }
        
    }
    
    return ans
}
출처: https://leechamin.tistory.com/485 [참신러닝 (Fresh-Learning):티스토리]