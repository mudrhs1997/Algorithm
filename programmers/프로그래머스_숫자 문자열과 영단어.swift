import Foundation

var s = ""
var num = ""
var result = [Int]()

while !s.isEmpty {
    var str = String(s.removeFirst())
    if str >= "0" && str <= "9" {
        result.append(Int(str)!)
    }
    if str >= "a" && str <= "z" {
        num += String(str)
    }
    
    if num == "one" {
        result.append(1)
        num = ""
    } else if num == "two" {
        result.append(2)
        num = ""
    } else if num == "three" {
        result.append(3)
        num = ""
    } else if num == "four" {
        result.append(4)
        num = ""
    } else if num == "five" {
        result.append(5)
        num = ""
    } else if num == "six" {
        result.append(6)
        num = ""
    } else if num == "seven" {
        result.append(7)
        num = ""
    } else if num == "eight" {
        result.append(8)
        num = ""
    } else if num == "nine" {
        result.append(9)
        num = ""
    } else if num == "zero" {
        result.append(0)
        num = ""
    }
}

print(result.map{String($0)}.joined())
