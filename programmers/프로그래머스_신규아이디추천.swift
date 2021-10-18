import Foundation

let new_id = "...!@BaT#*..y.abcdefghijklm-123_"
var cnt = 0
var resultLowercased = new_id.map { $0.lowercased() }
var resultFilt: [String] = resultLowercased.filter {
    (Character($0).asciiValue! > 96 && Character($0).asciiValue! < 123) || (Character($0).asciiValue! > 47 && Character($0).asciiValue! < 58)
    || Character($0).asciiValue! == 45 || Character($0).asciiValue! == 95 || Character($0).asciiValue! == 46
}
var result: [String] = [String]()
print(resultFilt)
for i in resultFilt {
    if i == "." && cnt == 0 {
        result.append(i)
        cnt += 1
    } else if i == "." && cnt > 0{
       cnt += 1
    } else {
        result.append(i)
        cnt = 0
    }
}

if result[0] == "." {
    result.removeFirst()
} else if result[result.count-1] == "." {
    result.removeLast()
}

if result.isEmpty {
    result.append("a")
}

if result.count > 15 {
    while result.count > 15 {
        result.removeLast()
    }
}

if result[result.count-1] == "." {
    result.removeLast()
}

if result.count < 3 {
    while result.count < 3 {
        result.append(result[result.count-1])
    }
}

print(result.joined(separator: ""))


