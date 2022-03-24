import Foundation

let s = "abccbaa"

var string = Array<Character>()
var limit = false
var result = 0
var index = 0
var letter = ""
var letters:Array<Character> = ["0"]

//if string.count % 2 == 0 {
//    limit = false
//} else {
//    limit = true
//}

// string메소드 시간복잡도 생각하면서 풀자

//while limit == false {
//
//    if !string.isEmpty {
//        for i in index..<(string.count/2)+1 {
//            if string[i] == letter {
//
//                string.remove(at: i-1)
//                string.remove(at: i-1)
//                letter = ""
//                if i < 2 {
//                    index = i-1
//                } else {
//                    index = i-2
//                }
//                break
//            } else {
//                letter = string[i]
//                if i == (string.count/2) {
//                    limit = true
//                }
//            }
//        }
//    } else {
//        result = 1
//        limit = true
//    }
//}


if s.count % 2 == 0 {
    for i in s {
        if letters.last == i {
            letters.popLast()
            
        } else {
            letters.append(i)
        }
    }
    
    if letters.count == 1 {
        result = 1
    } else {
        result = 0
    }
} else {
    result = 0
}



print(result)



