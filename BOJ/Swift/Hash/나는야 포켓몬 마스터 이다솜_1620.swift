import Foundation    

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic1 = [Int: String]()
var dic2 = [String: Int]()
for i in 0..<NM[0] {
    var pokemon = readLine()!
    dic1[i+1] = pokemon
    dic2[pokemon] = i+1
}
for i in 0..<NM[1] {
    let quiz = readLine()!
    if quiz.last!.isLetter {
        print(dic2[quiz]!)
    } else {
        print(dic1[Int(quiz)!]!)
    }
}