import Foundation

var string = readLine()!
while string != "." {
    var result = [Character]()
    for char in string {
        var ans = result.endIndex
        if result.isEmpty && ( char == ")" || char == "]" ) {
            result.append("f")
            break
        }
        if char == "(" {
            result.append(char)
        } else if char == ")" && result[ans-1] == "(" {
            result.removeLast()
            ans = result.endIndex
        } else if char == "[" {
            result.append(char)
        } else if char == "]" && result[ans-1] == "[" {
            result.removeLast()
            ans = result.endIndex
        } else if char == ")" && result[ans-1] == "[" {
            result.append("f")
            break
        } else if char == "]" && result[ans-1] == "(" {
            result.append("f")
            break
        }
    }
    
    if result.isEmpty {
        print("yes")
    } else {
        print("no")
    }
    string = readLine()!
}
