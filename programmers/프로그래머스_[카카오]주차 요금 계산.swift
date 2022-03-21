import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var record = [[String]]()
    var car = [String:Int]()
    var entry = [String:Bool]()
    var result = [Int]()

    for i in records {
        record.append(i.components(separatedBy: " "))
    }

    for i in 0..<record.count {

        let hasCar = car[record[i][1]] ?? -1
        let time = record[i][0].components(separatedBy: ":")
        let transtime = Int(time[0])! * 60 + Int(time[1])!

        if hasCar == -1 {
            car[record[i][1]] = transtime
            entry[record[i][1]] = true
        } else {
            car[record[i][1]]! = transtime - car[record[i][1]]!
            if record[i][2] == "IN" {
                entry[record[i][1]] = true
            } else {
                entry[record[i][1]] = false
            }
        }

    }

    for (c,isEnter) in entry {
        if isEnter {
            car[c] = 23*60+59 - car[c]!
        }

        if car[c]! <= fees[0] {
            car[c] = fees[1]
        } else {
            if (car[c]!-fees[0]) % fees[2] == 0 {
                car[c] = fees[1]+((car[c]!-fees[0])/fees[2])*fees[3]
            } else {
                car[c] = fees[1]+((car[c]!-fees[0])/fees[2])*fees[3]+fees[3]
            }
        }

    }

    for (key,value) in car.sorted{$0.0<$1.0} {
        result.append(value)
    }
    return result
}