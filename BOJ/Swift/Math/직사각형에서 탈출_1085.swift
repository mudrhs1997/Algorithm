import Foundation

let xywh = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let x = min(abs(xywh[0] - xywh[2]),abs(xywh[0]-0))
let y = min(abs(xywh[1] - xywh[3]),abs(xywh[1]-0))

print(min(x,y))
