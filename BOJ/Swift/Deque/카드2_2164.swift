import Foundation

var n = Int(String(readLine()!))!
var cards = [Int]()
for i in 1...n {
    cards.append(i)
}
var idx = 0

while n != 1 {
    cards[idx] = -1
    idx += 1
    n -= 1
    cards.append(cards[idx])
    idx += 1
}

print(cards[idx])

