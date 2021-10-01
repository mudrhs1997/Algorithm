import Foundation

var phone_number = "01074018997"

var result = String(repeating: "*", count: phone_number.count-4) + "\(phone_number.suffix(4))"

print(result)
