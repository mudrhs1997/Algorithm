func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {

    let map1 = arr1.map{ String(format:"%0\(n)ld", Int(String($0,radix: 2))!) }
    let map2 = arr2.map{ String(format:"%0\(n)ld", Int(String($0,radix: 2))!) }
    var resultMap = [String]()

    for i in 0..<n {
        var result = ""
        for j in 0..<n {
            let index = map1[i].index(map1[i].startIndex, offsetBy: j)
            if map1[i][index] == "0" && map2[i][index] == "0" {
                result += " "
            } else {
                result += "#"
            }
        }
        resultMap.append(result)
    }
    
    return resultMap
}