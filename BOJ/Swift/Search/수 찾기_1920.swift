import Foundation

let n = Int(String(readLine()!))!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted()
let m = Int(String(readLine()!))!
let b = readLine()!.components(separatedBy: " ").map{ Int($0)! }

for i in 0..<m {
    binarySearch(a, b[i])
}

func binarySearch(_ firstArray: [Int], _ temp: Int){

    if temp < firstArray[0] || temp > firstArray[firstArray.count - 1] {
        print(0)
        return
    } else {
        var start: Int = 0
        var end: Int = firstArray.count - 1
        var mid: Int = (end + start) / 2
        while (end-start >= 0) {
            if firstArray[mid] == temp {
                print(1)
                return
            } else if (firstArray[mid] < temp){
                start = mid + 1
            } else if (firstArray[mid] > temp){
                end = mid - 1
            }

            mid = (start + end) / 2
        }
        print(0)
    }

}


