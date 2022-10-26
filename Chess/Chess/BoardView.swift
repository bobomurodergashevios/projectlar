//
//  BoardView.swift
//  Chess
//
//  Created by Bobomurod Ergashev on 01/08/22.
//

import UIKit

class BoardView: UIView {
    let boardwidth: CGFloat = 0.8
    var marginX: CGFloat = 23
    var marginY: CGFloat = 37
    var cellSize: CGFloat = 40
    
    var allFigures : Set<Horse> = Set<Horse>()
    var chessdelegate : ChessDelegate? = nil
    var fromCol: Int = -10000
    var fromRow:Int = -100
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first
        let fingerlocation = first?.location(in: self)
        
        fromRow = Int(((fingerlocation?.y ?? 0.9)! - marginY) / cellSize)
        fromCol = Int(((fingerlocation?.x ?? 0.9)! - marginX) / cellSize)
        
        print("from (\(fromRow),\(fromCol))")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first
        let fingerlocation = first?.location(in: self)
        
        let toRow: Int = Int(((fingerlocation?.y ?? 0.9)! - marginY) / cellSize)
        let toCol: Int = Int(((fingerlocation?.x ?? 0.9)! - marginX) / cellSize)
        
        chessdelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        print("to (\(toRow),\(toCol))")
    }
    
    override func draw(_ rect: CGRect) {
        cellSize = bounds.width * boardwidth / 6.5
        marginX = bounds.width * 0.008
        marginY = bounds.height * 0.008
        drawBoard()
        drawPieces()
        
    }
    
    func drawPieces(){
        for figure in allFigures{
            let img = UIImage(named: figure.imageName)
            img?.draw(in: CGRect(x: marginX + CGFloat(figure.col)*cellSize, y: marginY + CGFloat(figure.row)*cellSize, width: cellSize, height: cellSize))
        }
       
    }
    func drawBoard(){
        for row in 0..<4{
            for col in 0..<4{
                drawSquare(col: col * 2, row: row * 2, color: .white)
                drawSquare(col: 1 + (col * 2), row: row * 2, color: .gray)
                drawSquare(col: col * 2, row: 1 + (row * 2), color: .gray)
                drawSquare(col: 1 + (col * 2), row: 1 + (row * 2), color: .white)
            }
          
        }
        
        
    }
    
    func drawSquare(col: Int,row: Int,color: UIColor){
        let path = UIBezierPath(rect: CGRect(x: marginX + CGFloat(col) * cellSize, y: marginY + CGFloat(row) * cellSize, width: cellSize, height: cellSize))
        color.setFill()
        path.fill()
    }
}
