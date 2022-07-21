import Foundation

let nm = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var map = [[String]]()
for _ in 0..<nm[0] {
    map.append(readLine()!.components(separatedBy: " "))
}
var min_dis = 987654321
var chicken = [(Int, Int)]()
var house = [(Int, Int)]()

for i in map.indices {
    for j in map[i].indices {
        if map[i][j] == "1" {
            house.append((i, j))
        } else if map[i][j] == "2" {
            chicken.append((i, j))
        }
    }
}
var distance = Array(repeating: 0, count: house.count)

func getMinDistance(_ cnt: Int, _ idx: Int) {
    for c in idx..<chicken.count-nm[1]+cnt {
        let tmp = distance
        for h in house.indices {
            let dis = abs(chicken[c].0 - house[h].0) + abs(chicken[c].1 - house[h].1)
            if distance[h] != 0 {
                distance[h] = min(distance[h],dis)
            } else {
                distance[h] = dis
            }
        }
        if cnt == nm[1] {
            var sum = 0
            distance.forEach { dis in
                sum += dis
            }
            min_dis = min(min_dis, sum)
            distance = tmp
        } else {
            getMinDistance(cnt+1, c+1)
            distance = tmp
        }
    }
}

getMinDistance(1,0)
print(min_dis)

