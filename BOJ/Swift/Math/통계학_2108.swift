import Foundation

let n = Int(String(readLine()!))!
var nums = [Int]()
for _ in 0..<n {
    nums += [Int(String(readLine()!))!]
}
nums.sort()
var sum: Double = 0
var idx = 1
var max = 1
var memo = 500001
var cnt = Array(repeating: [Int](), count: n+1)

nums.forEach { num in
    sum += Double(num)
    if num == memo {
        idx += 1
        cnt[idx] += [num]
        if idx >= max {
            max = idx
        }
    } else {
        idx = 1
        cnt[idx] += [num]
        memo = num
    }
    
}

print(Int(round(sum/Double(n))))
print(nums[(n/2)])
if cnt[max].count > 1 {
    print(cnt[max][1])
} else {
    print(cnt[max][0])
}
print(nums[n-1]-nums[0])
