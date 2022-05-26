import Foundation


/**
  0    32  0    17  0    0    0    0    0    0
  32  0    0    0    45  0    0    0    0    0
  0    0    0    18  0    0    5    0    0    0
  17  0    18  0    10  0    0    0    0    0
  0    45  0    10  0    28  0    0  25    0
  0    0    0    0    28  0    0    0    0    6
  0    0    5    0    0    0    0    59  0    0
  0    0    0    3    0    0    59  0    4    0
  0    0    0    0    25  0    0    4    0    12
  0    0    0    0    0    6    0    0    12  0
 */


//  kruskal 알고리즘
let INF = 999
let graph = [[0,32,INF,17,INF,INF,INF,INF,INF,INF],
             [32,0,INF,INF,45,INF,INF,INF,INF,INF],
             [INF,INF,0,18,INF,INF,5,INF,INF,INF],
             [17,INF,18,0,10,INF,INF,3,INF,INF],
             [INF,45,INF,10,0,28,INF,INF,25,INF],
             [INF,INF,INF,INF,28,0,INF,INF,INF,6],
             [INF,INF,5,INF,INF,INF,0,59,INF,INF],
             [INF,INF,INF,3,INF,INF,59,0,4,INF],
             [INF,INF,INF,INF,25,INF,INF,4,0,12],
             [INF,INF,INF,INF,INF,6,INF,INF,12,0]]

var MST = Array(repeating: Array(repeating: 0, count: 10), count: 10)

var matrix = [(1,2,32),(1,4,17),(2,5,45),(3,4,18),(3,7,5),(4,5,10),(4,8,3),(5,6,28),(5,9,25),(6,10,6),(7,8,59),(8,9,4),(9,10,12)]
var sortedMatrix = matrix.sorted { $0.2 < $1.2 }

var parent = Array(repeating: 0, count: 11)
var cost = 0

func find(_ x: Int) -> Int {
    if (x == parent[x]) {
        return x
    } else {
        let y = find(parent[x])
        parent[x] = y
        return y
    }
}

func union(_ x: Int, _ y: Int) {
    let root1 = find(x)
    let root2 = find(y)
    
    if root1 < root2 {
        parent[root2] = root1
    } else {
        parent[root1] = root2
    }
        
}

func kruskal() {
    
    for p in parent.indices {
        parent[p] = p
    }
    
    for m in sortedMatrix {
        if find(m.0) != find(m.1) {
            union(m.0, m.1)
            cost += m.2
            MST[m.0-1][m.1-1] = m.2
            MST[m.1-1][m.0-1] = m.2
        }
        
        
    }
}

kruskal()
print(cost)