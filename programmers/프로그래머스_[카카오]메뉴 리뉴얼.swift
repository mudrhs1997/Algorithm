import Foundation

var arr = Dictionary<Character,Set<Int>>()
var result = [String]()
var getResult = [String]()
var sortedArr = Array<(key: Character, value: Set<Int>)>()

var max = 1
var menu = ""
var intersectionMenu = Set<Int>()



func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    for order in 0..<orders.count {
        for i in orders[order] {
            
            let haveKey = arr.contains { (key: Character, value: Set<Int>) in
                key == i
            }
            
            if !haveKey {
                arr[i] = [order]
            } else {
                var element = arr[i]!
                element.insert(order)
                arr[i] = element
            }
            
        }
    }
    
    sortedArr = arr.sorted{$0.key < $1.key}
    
    for c in course {
        max = 2
        menuSet(num: c, count: 1, index: 0)
        result += getResult
        getResult = []
    }
    
    return result.sorted()
}

func menuSet(num: Int, count: Int, index: Int) {
    if num == count {
        for i in index..<arr.count {
            let searchMenu = menu
            menu += String(sortedArr[i].key)
            let count = intersectionMenu.intersection(sortedArr[i].value).count
            if max < count {
                max = count
                getResult = [menu]
            } else if max == count {
                getResult.append(menu)
            }
            menu = searchMenu
        }
    } else {
        for i in index..<sortedArr.count-num+count {
            let searchMenu = menu
            let searchIntersection = intersectionMenu
            if menu == "" {
                intersectionMenu = sortedArr[i].value
            } else {
                intersectionMenu = intersectionMenu.intersection(sortedArr[i].value)
            }
            menu += String(sortedArr[i].key)
            menuSet(num: num, count: count+1, index: i+1)
            menu = searchMenu
            intersectionMenu = searchIntersection
        }
        
    }
}

print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
