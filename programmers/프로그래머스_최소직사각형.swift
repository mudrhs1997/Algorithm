import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var transSizes = [[Int]]()

    for size in sizes {

        var transSize = [Int]()

        if size[0] <= size[1] {

            transSize.append(size[1])
            transSize.append(size[0])

            transSizes.append(transSize)
        } else {
            transSize.append(size[0])
            transSize.append(size[1])

            transSizes.append(transSize)
        }

    }

    var max1 = 0
    var max2 = 0
    for size in transSizes {

        if size[0] > max1 {
            max1 = size[0]
        }

        if size[1] > max2 {
            max2 = size[1]
        }

    }

    return max1*max2
}