import Foundation

let N = Int(readLine()!)!
let seq = readLine()!.components(separatedBy: " ").map{Int($0)!}
let numOfExpression = readLine()!.components(separatedBy: " ").map{Int($0)!}
var expression = [(String,Bool)]()
var resultArr = [Int]()


for ex in 0..<numOfExpression.count {
    if ex == 0 {
        for _ in 0..<numOfExpression[ex] {
            expression.append(("+",false))
            
        }
    } else if ex == 1 {
        for _ in 0..<numOfExpression[ex] {
            expression.append(("-",false))
            
        }
    } else if ex == 2 {
        for _ in 0..<numOfExpression[ex] {
            expression.append(("*",false))
            
        }
    } else if ex == 3 {
        for _ in 0..<numOfExpression[ex] {
            expression.append(("/",false))
            
        }
    }
}


func cal(index: Int, r: Int) {
    var result = r
    for ex in 0..<expression.count {
        if index == 1 {
            if expression[ex].0 == "+" {
                result = seq[0] + seq[1]
            } else if expression[ex].0 == "-" {
                result = seq[0] - seq[1]
            } else if expression[ex].0 == "*" {
                result = seq[0] * seq[1]
            } else if expression[ex].0 == "/" {
                result = seq[0] / seq[1]
            }
            if index == N-1 {
                resultArr.append(result)
                break
            } else {
                expression[ex].1 = true
                cal(index: index+1, r: result)
                expression[ex].1 = false
            }
        } else if index == N-1 {
            if expression[ex].0 == "+" && expression[ex].1 == false {
                result = result + seq[index]
                resultArr.append(result)
            } else if expression[ex].0 == "-" && expression[ex].1 == false {
                result = result - seq[index]
                resultArr.append(result)
            } else if expression[ex].0 == "*" && expression[ex].1 == false {
                result = result * seq[index]
                resultArr.append(result)
            } else if expression[ex].0 == "/" && expression[ex].1 == false {
                if result < 0 {
                    result = -(Int(result.magnitude) / seq[index])
                    resultArr.append(result)
                } else {
                    result = result / seq[index]
                    resultArr.append(result)
                }
            }
            
        } else {
            if expression[ex].0 == "+" && expression[ex].1 == false {
                result = result + seq[index]
                expression[ex].1 = true
                cal(index: index+1, r: result)
                expression[ex].1 = false
                result = r
            } else if expression[ex].0 == "-" && expression[ex].1 == false {
                result = result - seq[index]
                expression[ex].1 = true
                cal(index: index+1, r: result)
                expression[ex].1 = false
                result = r
            } else if expression[ex].0 == "*" && expression[ex].1 == false {
                result = result * seq[index]
                expression[ex].1 = true
                cal(index: index+1, r: result)
                expression[ex].1 = false
                result = r
            } else if expression[ex].0 == "/" && expression[ex].1 == false {
                if result < 0 {
                    result = -(Int(result.magnitude) / seq[index])
                    expression[ex].1 = true
                    cal(index: index+1, r: result)
                    expression[ex].1 = false
                    result = r
                } else {
                    result = result / seq[index]
                    expression[ex].1 = true
                    cal(index: index+1, r: result)
                    expression[ex].1 = false
                    result = r
                }
            }
            
        }
    }
}

cal(index: 1, r: 0)

print(resultArr.max()!)
print(resultArr.min()!)

