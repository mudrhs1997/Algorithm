import Foundation

var N = readLine()

var balloon = readLine()!.components(separatedBy: " ").enumerated().map{ ($0+1, Int($1)!) }

var index = 1
var value = balloon.removeFirst()

boom(value.1)

func boom(_ val: Int) {
    var num = val
    print(value.0, terminator: " ")
    if balloon.count == 0 { return }
    if balloon.count == 1 {
        print(balloon.removeFirst().0)
        return }
    if num>0 {
        for _ in 1..<num {
            let first = balloon.removeFirst()
            balloon.append(first)
        }
        value = balloon.removeFirst()
        num = value.1

        return boom(num)
        
    } else if num<0 {
        for _ in 1..<(-num) {
            let last = balloon.removeLast()
            balloon.insert(last, at: 0)
        }
        value = balloon.removeLast()
        num = value.1

        return boom(num)
    }
    
}
