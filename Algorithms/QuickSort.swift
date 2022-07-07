import Foundation

func quickSort(arr: [Int]) -> [Int] {
    
    if arr.count < 2 {
        return arr
    } else {
        let pivo = arr[0]
        let low = arr.filter { $0 < pivo } // pivo값보다 작은 배열을 생성한다.
        print(low)
        let high = arr.filter { $0 > pivo } // pivo값보다 큰 배열을 생성한다.
        print(high)
        return quickSort(arr: low) + [pivo] + quickSort(arr: high)
    }
    
}
