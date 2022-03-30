func solution(_ str1:String, _ str2:String) -> Int {
    var string1 = str1.uppercased()
    var string2 = str2.uppercased()

    var arr1 = Dictionary<String,Int>()
    var arr2 = Dictionary<String,Int>()

    var result1 = 0
    var arr1Value = 0
    var arr2Value = 0

    var divide = ""



    for i in string1 {

        if i.isLetter {
            divide += String(i)
            if divide.count == 2 {
                if arr1.contains(where: { (key: String, value: Int) in
                    key == divide
                }) {
                    arr1[divide] = arr1[divide]! + 1
                    divide = String(i)
                } else {
                    arr1[divide] = 1
                    divide = String(i)
                }
            }
        } else {
            divide = ""
        }

    }

    divide = ""

    for i in string2 {

        if i.isLetter {
            divide += String(i)
            if divide.count == 2 {
                if arr2.contains(where: { (key: String, value: Int) in
                    key == divide
                }) {
                    arr2[divide] = arr2[divide]! + 1
                    divide = String(i)

                } else {
                    arr2[divide] = 1
                    divide = String(i)

                }
            }
        } else {
            divide = ""
        }
    }


    for i in arr1 {
        for j in arr2 {
            if i.key == j.key {
                if i.value <= j.value {
                    result1 += i.value
                } else {
                    result1 += j.value
                }
            }
        }
        arr1Value += i.value
    }

    for i in arr2 {
        arr2Value += i.value
    }
     
    
    if (arr1Value+arr2Value) == 0{
        return 65536
    } else {
        return result1*65536/((arr1Value+arr2Value)-result1)
    }
    
}