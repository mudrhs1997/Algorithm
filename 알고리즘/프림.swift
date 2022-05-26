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


//  prim 알고리즘

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
var distances = Array(repeating: INF, count: 10)
var visited = Array(repeating: false, count: 10)
var nearest = Array(repeating: 1, count: 10)

func find_nearest(_ node: Int) {
    
    visited[node] = true
    
    for i in 0..<distances.count {
        if visited[i] == false {
            if graph[node][i] < distances[i] {
               distances[i] = graph[node][i]
                nearest[i] = node
            }
        }
    }
}

func prim() {
    
    var node = 0
    
    
    for _ in 0..<distances.count-1 {
        
        var min = INF
        distances[node] = -1
        find_nearest(node)
        
        for i in distances.indices {
            if distances[i] < min && distances[i] > 0 {
                min = distances[i]
                node = i
            }
        }
        
        MST[node][nearest[node]] = min
        MST[nearest[node]][node] = min
        
    }
    
}

prim()

print(MST)

