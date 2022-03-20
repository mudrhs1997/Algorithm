import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var hasActivity = 0
    var sum = 0

    for _ in 0..<count {
        hasActivity += 1
        sum += hasActivity * price
    }

    
    if money >= sum {
        return 0
    } else {
        return Int64(sum-money)
    }
}