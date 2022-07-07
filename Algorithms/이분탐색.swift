import Foundation


/**  이분 탐색(Binary Search)
    정렬되어 있는 배열에서 데이터를 찾으려 시도할 때,
    탐색 범위를 절반씩 줄여가며 찾아가는 search방법.
 
    시간 복잡도 = O(log n)
 **/
func binarySearch(n: Int, sortedArr: [Int], key: Int) -> Int {
    var low = 1
    var high = n
    var mid = 0
    var location = 0
    
    while low <= high && location == 0 {
        mid = (low+high)/2
        if key == sortedArr[mid] {
            location = mid
        } else if key < sortedArr[mid] {
            high = mid-1
        } else {
            low = mid+1
        }
    }
    
    return location
}

