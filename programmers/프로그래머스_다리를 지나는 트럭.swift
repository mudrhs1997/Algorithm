import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var currentWeight = 0
    var truck = truck_weights.count
    var idx = 0
    var current = 0
    var bridge = Array(repeating: 0, count: bridge_length+1)
    while truck > 0 {
        current += 1
        if bridge[current] != 0 {
            truck -= 1
            currentWeight -= bridge[current]
        }
        if weight - currentWeight >= truck_weights[idx] {
            bridge += [truck_weights[idx]]
            currentWeight += truck_weights[idx]
            idx = idx+1 > truck_weights.count-1 ? 0: idx+1
            continue
        } else {
            bridge += [0]
            continue
        }
    }
    
    return current
}