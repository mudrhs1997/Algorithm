import Foundation

let s = "3people  unFollowed me"
var str = s.lowercased()
var empty = true
var result: String = ""
for char in s {
    if empty {
        result += char.uppercased()
        empty = false
    } else {
        result += char.lowercased()
    }
    if char == " " { empty = true }
}

print(result)
