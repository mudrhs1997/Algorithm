import Foundation

let frameCount = Int(readLine()!)!
let recomandCount = Int(readLine()!)!
var recomanded = readLine()!.components(separatedBy: " ").map{Int($0)!}
var inFrame = [(Int, Int)]()

for r in recomanded {

    if !inFrame.isEmpty {
        
        let isContains = inFrame.contains{ $0.0 == r }
                
            
            if isContains {
                for i in 0..<inFrame.count {
                    if inFrame[i].0 == r {
                        inFrame[i].1 += 1

                    }
                }
            } else if inFrame.count == frameCount{
                var min = inFrame[0].1
                var isSame = true
                
                for i in 0..<inFrame.count {
                    if inFrame[i].1 < min {
                        min = inFrame[i].1
                        isSame = false
                    }
                }
                
                if isSame {
                    inFrame.removeFirst()
                    inFrame.append((r, 1))
                } else {
                    for i in 0..<inFrame.count {
                        if inFrame[i].1 == min {
                            inFrame.remove(at: i)
                            inFrame.append((r, 1))
                            break
                        }
                    }
                }
            } else {
                inFrame.append((r, 1))
            }
        print(inFrame)
    } else {
        inFrame.append((r, 1))
    }
}

inFrame.sort{ $0.0 < $1.0 }

var result = ""

for (i, r) in inFrame {
    result += "\(i) "
}

print(result)

