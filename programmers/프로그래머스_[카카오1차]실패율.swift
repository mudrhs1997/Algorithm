import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var person = stages.count
    var fail = [(Int,Double)]()
    var sortedStages = stages.sorted()

    for stage in 1...N {

        var failPerson:Double = 0
        let numOfStages = sortedStages.count

        if sortedStages.contains(stage) {
            while sortedStages.first == stage {
                failPerson += 1
                sortedStages.removeFirst()
            }
        }

        if failPerson == 0 {
            fail.append((stage,0))
        } else {
            fail.append((stage,failPerson/Double(numOfStages)))
        }
    }


    var result = [Int]()

    for failure in fail.sorted{$0.1>$1.1} {
        result.append(failure.0)
    }
    
    return result
}