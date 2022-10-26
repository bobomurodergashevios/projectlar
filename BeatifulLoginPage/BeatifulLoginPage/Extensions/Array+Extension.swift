//
//  Array+Extension.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 07/08/22.
//

import Foundation



extension Array where Element == Mcontact{
    
    func search(key: String) -> [Mcontact] {
            var list = [Mcontact]()
            var startList = [Mcontact]()
            var containsList = [Mcontact]()
        var flag = true
            //Mu90
        for item in key {
            if item.isNumber {
                flag = false
            }
        }
        
        if flag{
            for item in self {
                if item.name.lowercased().starts(with: key.lowercased()) {
                    startList.append(item)
                } else
                if item.name.lowercased().contains(key.lowercased()) {
                    containsList.append(item)
                }
            }
            list.append(contentsOf: startList)
            list.append(contentsOf: containsList)
            print("true")
            return list
        }else{
            for item in self {
                var strNumberPiece = ""
                var strNamePiece = ""
                for piece in key{
                    if piece.isNumber{
                            strNumberPiece += String(piece)
                    }else if piece.isLetter{
                        strNamePiece += String(piece)
                    }
                }
                
                if strNamePiece.isEmpty{
                    if item.phone.starts(with: strNumberPiece){
                        startList.append(item)
                    }else if item.phone.contains(strNumberPiece){
                        containsList.append(item)
                    }
                }else{
                    if item.name.lowercased().starts(with: strNamePiece) && item.phone.starts(with: strNumberPiece){
                        startList.append(item)
                    } else
                    if item.name.lowercased().contains(strNamePiece.lowercased()) && item.phone.contains(strNumberPiece) {
                        containsList.append(item)
                    }
                }
               
            }
            list.append(contentsOf: startList)
            list.append(contentsOf: containsList)
            
            return list
        }
        
         
    }
    
    
    func sear(_ contact: Mcontact) -> Bool{
        for item in FavouritosViewController.favarr{
            if item.name == contact.name && item.phone == contact.phone{
                return false
            }
        }
        return true
    }
}
