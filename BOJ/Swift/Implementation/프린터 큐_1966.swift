import Foundation

let n = Int(String(readLine()!))!
for _ in 0..<n {
    let nm = readLine()!.components(separatedBy: " ").map{Int($0)!}
    var nums = readLine()!.components(separatedBy: " ").map{Int($0)!}
    var cnt = 0
    var isOut = false
    while !isOut {
        for i in 0..<nm[0] {
            if nums.max()! == nums[i] {
                nums[i] = 0
                cnt += 1
                if i == nm[1] {
                    isOut = true
                    print(cnt)
                }
            } else {
                continue
            }
                
        }
        
    }
}
