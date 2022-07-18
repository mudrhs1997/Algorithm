import Foundation

var escape = true

while escape {
    let str = readLine()!
    var reverse = ""
    if str == "0" {
        escape = false
    } else {
        for c in str.reversed() {
            reverse += String(c)
        }
        
        if str == reverse {
            print("yes")
        } else {
            print("no")
        }
    }
}
