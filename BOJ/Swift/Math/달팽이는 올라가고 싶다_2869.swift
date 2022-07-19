import Foundation

let abv = readLine()!.components(separatedBy: " ").map{ Int($0)! }

if (abv[2]-abv[0])%(abv[0]-abv[1]) == 0 {
    print((abv[2]-abv[0])/(abv[0]-abv[1])+1)
} else {
    print((abv[2]-abv[0])/(abv[0]-abv[1])+2)
}
