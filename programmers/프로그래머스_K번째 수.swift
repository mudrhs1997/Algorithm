import Foundation


var array = [1,5,2,6,3,7,4]
var commands = [[2,5,3],[4,4,1],[1,7,3]]



func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var resultSet: [Int] = []
    for command in commands {
        let start: Int = command[0]-1
        let end: Int = command[1]-1
        let result = array[start...end]
        let sortedresult = result.sorted()
        resultSet.append(sortedresult[command[2]-1])
    }
    return resultSet
}


