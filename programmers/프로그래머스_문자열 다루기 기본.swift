import Foundation

let s = "1"
var isLetter = true

for char in s {
    if char >= "a" && char <= "z" {
        isLetter = false
        break
    }
}

if isLetter == true && (s.count == 4 || s.count == 6) {
    return true
} else {
    return false
}


