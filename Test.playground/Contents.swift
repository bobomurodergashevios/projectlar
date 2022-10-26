//import UIKit
//import Foundation
//
//
//
//// 1
//var alphabet = "ABCDEFGHIJKLMNOPQRSTUVXYZW"
//var a = "bdknm"
//func nimadir(_ a: String,_ alphabet: String)->String {
//    var newstr = alphabet.lowercased()
//    var result = ""
//    for i in a {
//        for j in newstr{
//            if i != j{
//                result.append(j)
//            }
//        }
//        newstr = result
//        result.removeAll()
//    }
//    return newstr
//}
//print(nimadir(a, alphabet))
//
//
//
//// 2
//
//var str : [String] = ["cow","cow","pig","pig","sheep","cow"]
//
//func nimadir(_ str: [String])->[String] {
//    var newarr : [String] = []
//
//    for i in 0 ..< str.count{
//        for j in i+1 ..< str.count {
//            if str[i] == str[j] && !newarr.contains(str[i]+"s") {
//                newarr.append(str[i]+"s")
//            }else if !newarr.contains(str[i]) && !newarr.contains(str[i]+"s"){
//                newarr.append(str[i])
//            }
//        }
//    }
//    return newarr
//}
//
//print(nimadir(str))
//
//
//// 3
//
//
//
//
//class Talaba {
//    var id : Int
//    var name : String
//    var data_birth : String
//    var score : Int
//    
//    
//    init(id: Int,name: String,data_birth: String,score: Int){
//        self.id = id
//        self.name = name
//        self.data_birth = data_birth
//        self.score = score
//    }
//    
//    
//    
//    
//     
//        
//    }
//}
//
//
//var dataList: [Talaba]  = [
//    Talaba(id: 1, name: "bob", data_birth: "19981027", score: 5),
//    Talaba(id: 2, name: "tom", data_birth: "19961227", score: 4),
//    Talaba(id: 5, name: "lol", data_birth: "19981127", score: 3),
//    Talaba(id: 4, name: "sel", data_birth: "19980127", score: 4),
//    Talaba(id: 3, name: "vfb", data_birth: "19981227", score: 4),
//    Talaba(id: 6, name: "qds", data_birth: "19980927", score: 3),
//    Talaba(id: 8, name: "rer", data_birth: "19980227", score: 4),
//    Talaba(id: 9, name: "ss2", data_birth: "19980327", score: 5),
//    Talaba(id: 7, name: "vffw", data_birth: "19980227", score: 4),
//    Talaba(id: 10, name: "oaoo", data_birth: "19981227", score: 4),
//    Talaba(id: 12, name: "lee", data_birth: "19980527", score: 5),
//    Talaba(id: 11, name: "pqpqp", data_birth: "19980727", score: 3),
//    Talaba(id: 13, name: "eeert", data_birth: "19980927", score: 5),
//]
//
//
