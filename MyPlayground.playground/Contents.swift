import UIKit
//print(fjfd)
import Foundation


func formatDataToUser(number: String) -> String{
    var newnumber = number.prefix(number.count-15)
    var list = [4,2,2]
    var result = ""
    for i in 0 ..< list.count{
        result = result + newnumber.prefix(list[i])
        newnumber.removeFirst(list[i])
    }
    return String(result)
}


print(formatDataToUser(number: "2022-09-15 16:06:15 +0000")
)
