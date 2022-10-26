//
//  ChessEngine.swift
//  Chess
//
//  Created by Bobomurod Ergashev on 01/08/22.
//

import Foundation

struct ChessEngine {
    var allFigures : Set<Horse> = Set<Horse>()
    var flag = true
    mutating func movePiece(fromCol: Int,fromRow: Int,toCol: Int,toRow:Int){
        guard let candidate = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        switch candidate.imageName{
        case "Knight-black" , "Knight-white": do {
            // -1- // MARK: For Horse Move
            if let piec = pieceAt(col: toCol, row: toRow){
                if (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
                    (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
                    (abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1) {
                    
                    if piec.imageName.last != candidate.imageName.last {
                        allFigures.remove(piec)
                        allFigures.remove(candidate)
                        allFigures.insert(Horse(col: toCol, row: toRow, imageName: candidate.imageName))
                    }
                    
                }
            }else if (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
                        (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
                        (abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1) {
                        allFigures.remove(candidate)
                        allFigures.insert(Horse(col: toCol, row: toRow, imageName: candidate.imageName))
            }
           // -1- // MARK: Horse move end
        }
        case "Rook-black" , "Rook-white" : do{
            if candidate.imageName == "Rook-black"{
                if fromRow > toRow{ // orqaga
//                    for i in toCol ... fromCol{
                        for j in toRow ... fromRow{
                            if let piec = pieceAt(col: fromCol, row: j){
                                        if piec.imageName.last == "k"{

                                        }else{
                                            allFigures.remove(piec)
                                            allFigures.remove(candidate)
                                            allFigures.insert(Horse(col: fromCol, row: j, imageName: piec.imageName))
                                        }
                                    }else{
                                        allFigures.remove(candidate)
                                                           allFigures.insert(Horse(col: toCol, row: toRow, imageName: candidate.imageName))
                                    }
                        }
//                    }
                }else if fromRow < toRow{ // oldinga
//                    for i in fromCol ... toCol{
                        for j in fromRow ... toRow{
                            if let piec = pieceAt(col: fromCol, row: j) {
                                if  pieceAt(col: fromCol, row: j) != nil{
                                    if piec.imageName.last == "k"{
                                       
                                    }else{
                                        flag = true
                                        print(flag)
                                        allFigures.remove(candidate)
                                        allFigures.remove(piec)
                                     
                                        allFigures.insert(Horse(col: fromCol, row: j, imageName: candidate.imageName))
                                    }
                                    
                                }else if flag{
                                    allFigures.remove(candidate)
                                                       allFigures.insert(Horse(col: toCol, row: toRow, imageName: candidate.imageName))
                                    
                                    print("insert")
                                }
                                flag = false
//                                print(flag)
                                 
                            }
                            
                        }
//                    }
                    
                }
           
            
               
            }
//            if !allFigures.contains(pieceAt(col: toCol, row: toRow) ?? Horse(col: 0, row: 0, imageName: "x")){
       
//                if toCol == fromCol || toRow == fromRow {
//                    allFigures.remove(candidate)
//                    allFigures.insert(Horse(col: toCol, row: toRow, imageName: candidate.imageName))
//                }
            
               
//            }
           
        }
            
        default:
            return
        }
       
        
        
        
        
    }
    func allFiguresMove(piec: Horse,candidate: Horse,toCol: Int,toRow: Int,fromCol:Int,fromRow:Int){
//        if let piec = pieceAt(col: toCol, row: toRow){
//
//            if (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
//                (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
//                (abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1) {
//
//                if piec.imageName.last != candidate.imageName.last {
//                    pieces.remove(piec)
//                    pieces.remove(candidate)
//                    pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: candidate.imageName))
//                }
//
//            }
//        }else if (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
//                    (abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2) ||
//                    (abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1) {
//                    pieces.remove(candidate)
//                    pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: candidate.imageName))
//        }
    }
    
    func pieceAt(col: Int,row: Int) -> Horse?{
        for piece in allFigures{
            if piece.col == col && piece.row == row{
                return piece
            }
        }
        return nil
    }
    
    mutating func initializeGame(){
        allFigures.removeAll()
        
        
//        allFigures.insert(Horse(col: 0, row: 0, imageName: "Rook-black"))
//        allFigures.insert(Horse(col: 7, row: 0, imageName: "Rook-black"))
//        allFigures.insert(Horse(col: 0, row: 7, imageName: "Rook-white"))
//        allFigures.insert(Horse(col: 7, row: 7, imageName: "Rook-white"))
        allFigures.insert(Horse(col: 1, row: 0, imageName: "Knight-black"))
        allFigures.insert(Horse(col: 6, row: 0, imageName: "Knight-black"))
        allFigures.insert(Horse(col: 1, row: 7, imageName: "Knight-white"))
        allFigures.insert(Horse(col: 6, row: 7, imageName: "Knight-white"))
//        allFigures.insert(Horse(col: 2, row: 0, imageName: "Bishop-black"))
//        allFigures.insert(Horse(col: 5, row: 0, imageName: "Bishop-black"))
//        allFigures.insert(Horse(col: 2, row: 7, imageName: "Bishop-white"))
//        allFigures.insert(Horse(col: 5, row: 7, imageName: "Bishop-white"))
//        allFigures.insert(Horse(col: 3, row: 0, imageName: "Queen-black"))
//        allFigures.insert(Horse(col: 3, row: 7, imageName: "Queen-white"))
//        allFigures.insert(Horse(col: 4, row: 0, imageName: "King-black"))
//        allFigures.insert(Horse(col: 4, row: 7, imageName: "King-white"))
//        allFigures.insert(Horse(col: 0, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 1, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 2, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 3, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 4, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 5, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 6, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 7, row: 1, imageName: "Pawn-black"))
//        allFigures.insert(Horse(col: 0, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 1, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 2, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 3, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 4, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 5, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 6, row: 6, imageName: "Pawn-white"))
//        allFigures.insert(Horse(col: 7, row: 6, imageName: "Pawn-white"))
    }
    
    
}

