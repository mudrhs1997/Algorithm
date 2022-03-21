import Foundation

func solution(_ record:[String]) -> [String] {
    var history = [(String,String)]()
    var user = [String:String]()
    var recorded = record.map{$0.components(separatedBy: " ")}
    var result = [String]()

    for manage in recorded {

        if manage[0] == "Enter" {
            user[manage[1]] = manage[2]
            history.append((manage[1],"님이 들어왔습니다."))
        } else if manage[0] == "Leave" {
            history.append((manage[1],"님이 나갔습니다."))
        } else if manage[0] == "Change" {
            user[manage[1]] = manage[2]
        }
    }

    for i in history {
        result.append("\(user[i.0]!)"+"\(i.1)")
    }
    
    return result
}