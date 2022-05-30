import Foundation

//  dijikstra 알고리즘

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

var length = Array(repeating: INF, count: 10)
var visited = Array(repeating: false, count: 10)
var nearest = Array(repeating: 1, count: 10)

func find_nearest(_ node: Int) {
    
    visited[node] = true
    
    for i in 0..<length.count {
        if visited[i] == false {
            if graph[node][i] < length[i] {
                length[i] = graph[node][i]
                nearest[i] = node
            }
        }
    }
}

func dijikstra() {
    
    find_nearest(0)
    
    for _ in 0..<length.count-1 {
        
        var node = 0
        var min = INF
        
        for i in length.indices {
            if length[i] < min && length[i] > 0 && visited[i] != true {
                min = length[i]
                node = i
            }
        }
        
        visited[node] = true
        
        for i in length.indices {
            if visited[i] != true {
                if length[node] + graph[node][i] < length[i] {
                    length[i] = length[node] + graph[node][i]
                    nearest[i] = node
                }
            }
        }
        
    }
    
}

dijikstra()