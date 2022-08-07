import Foundation

func solution(_ citations:[Int]) -> Int {
    let cit = citations.sorted()
    var h_idx = 0
    
    var start = 0
    var end = cit[citations.count-1]
    var mid = (end + start) / 2
    while start <= end {
        let cnt = cit.filter{$0>=mid}.count
        if cnt >= mid {
            h_idx = max(h_idx,mid)
        }
        if cnt < mid {
            end = mid - 1
        } else {
            start = mid + 1
        }
        mid = (end+start) / 2
    }
    
    
    return h_idx
}