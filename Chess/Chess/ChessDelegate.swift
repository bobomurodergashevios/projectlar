//
//  ChessDelegate.swift
//  Chess
//
//  Created by Bobomurod Ergashev on 01/08/22.
//

import Foundation

protocol ChessDelegate{
    func movePiece(fromCol: Int,fromRow:Int,toCol:Int,toRow:Int)
}
