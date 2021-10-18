import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var key: [[String]] = [[String]](repeating: [String](repeating: "", count: 3), count: 4)
    var left: UInt = 0
    var right: UInt = 0
    var recentLeft = (0, 0)
    var recentRight = (0, 0)
    key[3][0] = "L"
    key[3][2] = "R"
    var result: [String] = [String]()
    
    for number in numbers {
        switch number {
        case 1:
            result.append("L")
            delete("L")
            key[0][0] = "L"
        case 4:
            result.append("L")
            delete("L")
            key[1][0] = "L"
        case 7:
            result.append("L")
            delete("L")
            key[2][0] = "L"
        case 3:
            result.append("R")
            delete("R")
            key[0][2] = "R"
        case 6:
            result.append("R")
            delete("R")
            key[1][2] = "R"
        case 9:
            result.append("R")
            delete("R")
            key[2][2] = "R"
        case 2:
            find("L","R")
            move(0,1)
        case 5:
            find("L","R")
            move(1, 1)
        case 8:
            find("L","R")
            move(2, 1)
        case 0:
            find("L","R")
            move(3, 1)
        default :
            break
        }
    }
    
    func find(_ left: String, _ right: String) {
        for i in 0...3 {
            for j in 0...2 {
                if key[i][j] == left {
                    recentLeft = (i,j)
                } else if key[i][j] == right {
                    recentRight = (i,j)
                }
            }
        }
    }
    
    func delete(_ hand: String) {
        for i in 0...3 {
            for j in 0...2 {
                if key[i][j] == hand {
                    key[i][j] = ""
                }
            }
        }
    }
    
    func move(_ x: Int, _ y: Int) {
        left = (recentLeft.0 - x).magnitude + (recentLeft.1 - y).magnitude
        right = (recentRight.0 - x).magnitude + (recentRight.1 - y).magnitude
        if left > right {
            delete("R")
            key[x][y] = "R"
            result.append("R")
        } else if left < right {
            delete("L")
            key[x][y] = "L"
            result.append("L")
        } else {
            if hand == "right" {
                delete("R")
                key[x][y] = "R"
                result.append("R")
            } else {
                delete("L")
                key[x][y] = "L"
                result.append("L")
            }
        }
        left = 0; right = 0
    }
    
    return result.joined(separator: "")
    
}

print(solution([1,3,4,5],"right"))
