import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var Clothes = [(Int,Int)]()

    for i in 1...n {
        var numOfClothes = 1
        if lost.contains(i) {
            numOfClothes -= 1
        }
        if reserve.contains(i) {
            numOfClothes += 1
        }

        Clothes.append((i,numOfClothes))
    }


    for i in 0..<Clothes.count {
        if Clothes[i].1 == 0 {
            if i == 0 {
                if Clothes[i+1].1 == 2 {
                    Clothes[i].1 += 1
                    Clothes[i+1].1 -= 1
                }
            } else if i == Clothes.count-1 {
                if Clothes[i-1].1 == 2 {
                    Clothes[i].1 += 1
                    Clothes[i-1].1 -= 1
                }
            } else {
                if Clothes[i-1].1 == 2 {
                    Clothes[i].1 += 1
                    Clothes[i-1].1 -= 1
                } else if Clothes[i+1].1 == 2 {
                    Clothes[i].1 += 1
                    Clothes[i+1].1 -= 1
                }

            }
        }
    }

    var result = Clothes.count

    for i in Clothes {
        if i.1 == 0 {
            result -= 1
        }
    }
    
    return result
}