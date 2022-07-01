//	* 깡구현 다시 한 번 보자



// 1. Dice 클래스 인스턴스 생성
let dice = Dice()

// 2. m, n, x, y, k 값을 읽어옴
let mnxyk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = mnxyk[0], n = mnxyk[1]
var x = mnxyk[2], y = mnxyk[3]

// 3. 지도 생성 (가로 크기가 m 이고 세로 크기가 n)
var location: [[Int]] = Array(repeating: [], count: m)

// 4. 지도에 값 넣기
for i in 0..<m {
    let row = readLine()!.split { $0 == " " }.map {Int(String($0))! }
    location[i] = row
}

// 5. 이동 명령 읽기
let orders = readLine()!.split { $0 == " " }.map{ Int(String($0))! }

// 6. 이동 명령에 대한 반복문
orders.forEach { order in
    // 7.
    // 1 = 동쪽, 2 = 서쪽, 3 = 북쪽, 4 = 남쪽
    switch order {
    case 1:
        // 8. 동쪽으로 이동이 가능하면
        if y + 1 < n {
            // 9. 동쪽으로 이동하고 값 갱신
            location[x][y + 1] = dice.move(order, location[x][y + 1])
            y += 1
        }
    // 9. 위와 동일함
    case 2:
        if y - 1 >= 0 {
            location[x][y - 1] = dice.move(order, location[x][y - 1])
            y -= 1
        }
    case 3:
        if x - 1 >= 0 {
            location[x - 1][y] = dice.move(order, location[x - 1][y])
            x -= 1
        }
    case 4:
        if x + 1 < m {
            location[x + 1][y] = dice.move(order, location[x + 1][y])
            x += 1
        }
    default:
        break
    }
}

// 10. Dice 클래스
class Dice {
    // 11. 주사위의 초기값은 0 이므로 모두 0으로 초기화했음
    var top: Int = 0
    var bottom: Int = 0
    var left: Int = 0
    var right: Int = 0
    var up: Int = 0
    var down: Int = 0
    
    //        up
    // left, top, right
    //       down
    //      bottom
    // 이런 모양임
    
    // 12. 주사위 이동시키는 함수
    // 방향 (order) 와 움직인 위치의 값 (value) 를 받음
    func move(_ order: Int, _ value: Int) -> Int {
        // 13. 먼저 이동하기 전 주사위의 상태를 저장함
        let temp = (top: top,
                    bottom: bottom,
                    left: left,
                    right: right,
                    up: up,
                    down: down)
        
        // 14. 그리고 명령에 맞게 이동함
        switch order {
        case 1:
            top = temp.left
            left = temp.bottom
            right = temp.top
            bottom = temp.right
        case 2:
            top = temp.right
            left = temp.top
            right = temp.bottom
            bottom = temp.left
        case 3:
            up = temp.top
            top = temp.down
            down = temp.bottom
            bottom = temp.up
        case 4:
            up = temp.bottom
            top = temp.up
            down = temp.top
            bottom = temp.down
            
        default:
            return value
        }
        
        // 15. 이동한 후에 최상단에 있는 값을 출력
        print(top)
        
        // 16. 만약 현재 밟고 있는 지도의 값이 0 이면
        if value == 0 {
            // 17. 현재 주사위의 바닥 값을 리턴 (지도의 값에 주사위 바닥 값을 설정하기 위함)
            return self.bottom
        } else {
            // 18. 그렇지 않은 경우 주사위 바닥 값에 밟고 있는 지도의 값으로 설정하고
            bottom = value
            // 0 을 리턴 (지도의 값을 0으로 만들기 위함)
            return 0
        }
    }
}