import Foundation

let n = Int(String(readLine()!))!
var cnt = 0
for i in 666...2666799 {
    var num = i
    while num >= 666 {
        if num%1000 == 666 {
            cnt += 1
            break
        }
        num /= 10
    }
    
    if cnt == n {
        print(i)
        break
    }
}

