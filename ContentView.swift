//
//  ContentView.swift
//  ChessSpeak
//
//  Created by Daniel Madjar on 4/10/23.
//

import SwiftUI

struct Piece {
    var color: String
    var name: String
    var squaresAttacking = [(Int, Int)]()
    
    init(color: String, name: String) {
        self.color = color
        self.name = name
    }
}

struct Square {
    var p: Piece
    var isAttacked: Bool
    
    init(p: Piece, isAttacked: Bool) {
        self.p = p
        self.isAttacked = isAttacked
    }
}


struct BoardView: View {
    @State var squares: [[Square]] = [
        [
            Square(p: Piece(color: "B", name: "R"), isAttacked: false),
            Square(p: Piece(color: "B", name: "N"), isAttacked: false),
            Square(p: Piece(color: "B", name: "B"), isAttacked: false),
            Square(p: Piece(color: "B", name: "Q"), isAttacked: false),
            Square(p: Piece(color: "B", name: "K"), isAttacked: false),
            Square(p: Piece(color: "B", name: "B"), isAttacked: false),
            Square(p: Piece(color: "B", name: "N"), isAttacked: false),
            Square(p: Piece(color: "B", name: "R"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false),
            Square(p: Piece(color: "B", name: "P"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false),
            Square(p: Piece(color: "B", name: "X"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false),
            Square(p: Piece(color: "W", name: "P"), isAttacked: false)
        ],
        [
            Square(p: Piece(color: "W", name: "R"), isAttacked: false),
            Square(p: Piece(color: "W", name: "N"), isAttacked: false),
            Square(p: Piece(color: "W", name: "B"), isAttacked: false),
            Square(p: Piece(color: "W", name: "Q"), isAttacked: false),
            Square(p: Piece(color: "W", name: "K"), isAttacked: false),
            Square(p: Piece(color: "W", name: "B"), isAttacked: false),
            Square(p: Piece(color: "W", name: "N"), isAttacked: false),
            Square(p: Piece(color: "W", name: "R"), isAttacked: false)
        ]
    ]
    
    @State var pieceCoordinates: (Int, Int)
    @State var pieceSelected: Bool = false
    
    @State var secondSquare: (Int, Int) = (0, 0)
    
    @State var firstClick: Bool = true
    @State var secondClick: Bool = false
    
    @State var whitesTurn: Bool = true
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ForEach(0..<8) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<8) { column in
                            Button {
                                
//                                if firstClick {
//                                    pieceCoordinates = (row, column)
//                                    findValidSquares(row: row, column: column)
//                                    pieceSelected.toggle()
//                                } else if secondClick {
//                                    secondSquare = (row, column)
//
//                                    if isValidMove(pieceCoords: pieceCoordinates, end: secondSquare) {
//                                        movePiece(start: pieceCoordinates, end: secondSquare)
//                                        whitesTurn.toggle()
//                                        pieceSelected.toggle()
//                                    }
//                                }
//
//                                firstClick.toggle()
//                                secondClick.toggle()
                                
                                
                                if firstClick {
                                    pieceCoordinates = (row, column) // Piece Selected
                                    findValidSquares(row: row, column: column)
                                    pieceSelected.toggle()
                                }
                                
                                if secondClick {
                                    secondSquare = (row, column)
                                    
                                    if isValidMove(pieceCoords: pieceCoordinates, end: secondSquare) {
                                        movePiece(start: pieceCoordinates, end: secondSquare)
                                        whitesTurn.toggle()
                                        pieceSelected.toggle()
                                       
                                    } else {
                                        if squares[row][column].p.name != "X" && (squares[row][column].p.color == squares[pieceCoordinates.0][pieceCoordinates.1].p.color) { // Try to move a piece to another friendly piece
                                            
                                            firstClick.toggle()
                                            secondClick.toggle()
                                            
                                        } else {
                                            secondSquare = (-1, -1)
                                            pieceSelected.toggle()
                                        }
                                    }
                                }
                                
                                firstClick.toggle()
                                secondClick.toggle()
                            } label: {
                                ZStack {
                                    Rectangle()
                                       .fill(isWhite(row: row, column: column, pieceCoordinates: pieceCoordinates))
                                       .frame(width: 50, height: 50)

                                    if squares[row][column].p.name == "P" {
                                       Image("pawn2")
                                           .resizable()
                                           .renderingMode(.template)
                                           .foregroundColor(displayColor(pieceColor: squares[row][column].p.color))
                                           .frame(width: 50, height: 50)
                                   } else if squares[row][column].p.name == "R" {
                                       Image("rook")
                                           .resizable()
                                           .renderingMode(.template)
                                           .foregroundColor(displayColor(pieceColor: squares[row][column].p.color))
                                           .frame(width: 40, height: 35)
                                   }
                               }
                            }
                            .disabled(canClick(pieceColor: squares[row][column].p.color))
                        }
                    }
                }
            }
        }
    }
    
    func isValidMove(pieceCoords: (Int, Int), end: (Int, Int)) -> Bool {
        let piece = squares[pieceCoords.0][pieceCoords.1].p
        
        for (pieceRow, pieceColumn) in piece.squaresAttacking {
            if end.0 == pieceRow && end.1 == pieceColumn {
                return true
            }
        }
        
        return false
    }
    
    func isWhite(row: Int, column: Int, pieceCoordinates: (Int, Int)) -> Color {
        
        if pieceSelected {
            let piece = squares[pieceCoordinates.0][pieceCoordinates.1].p
            
            for (pieceRow, pieceColumn) in piece.squaresAttacking {
                if row == pieceRow && column == pieceColumn {
                    return Color(.yellow)
                }
            }
        }
        
        if row % 2 == 0 && column % 2 == 0 {
            return Color(.white)
        } else if row % 2 != 0 && column % 2 != 0 {
            return Color(.white)
        } else {
            
            return Color(.black)
        }
    }
    
    func findValidSquares(row: Int, column: Int) {
        let piece = squares[row][column].p
        squares[row][column].p.squaresAttacking = []
        
        if piece.name == "P" {
            if piece.color == "W" {
                if squares[row - 1][column].p.name == "X" {
                    squares[row][column].p.squaresAttacking.append((row - 1, column))
                    
                    if squares[row - 2][column].p.name == "X" && row == 6 {
                        squares[row][column].p.squaresAttacking.append((row - 2, column))
                    }
                }
              
                if column != 0 {
                    if squares[row - 1][column - 1].p.name != "X"
                    && squares[row - 1][column - 1].p.color != piece.color { // Can Take Left Diagonally
                        squares[row][column].p.squaresAttacking.append((row - 1, column - 1))
                    }
                }
                
                if column != 7 {
                    if squares[row - 1][column + 1].p.name != "X"
                    && squares[row - 1][column + 1].p.color != piece.color {
                        squares[row][column].p.squaresAttacking.append((row - 1, column + 1))
                    }
                }
            } else if piece.color == "B" {
                if squares[row + 1][column].p.name == "X" {
                    squares[row][column].p.squaresAttacking.append((row + 1, column))
                    
                    if squares[row + 2][column].p.name == "X" && row == 1 {
                        squares[row][column].p.squaresAttacking.append((row + 2, column))
                    }
                }
                
                if column != 0 {
                    if squares[row + 1][column - 1].p.name != "X"
                    && squares[row + 1][column - 1].p.color != piece.color { // Can Take Left Diagonally
                        squares[row][column].p.squaresAttacking.append((row + 1, column - 1))
                    }
                }
                
                if column != 7 {
                    if squares[row + 1][column + 1].p.name != "X"
                        && squares[row + 1][column + 1].p.color != piece.color {
                        squares[row][column].p.squaresAttacking.append((row + 1, column + 1))
                    }
                }
            }
           
        }
        
        if piece.name == "R" {
            
            var northSquare = row - 1
            var southSquare = row + 1
            var eastSquare = column + 1
            var westSquare = column - 1
            
            while (northSquare >= 0) { //Lets Rook Move Up
                if (squares[northSquare][column].p.name == "X") {
                    squares[row][column].p.squaresAttacking.append((northSquare, column))
                    northSquare -= 1
                } else {
                    if (squares[northSquare][column].p.color != piece.color) {
                        squares[row][column].p.squaresAttacking.append((northSquare, column))
                    }
                    
                    break;
                }
            }
            
            while (southSquare <= 7) { //Lets Rook Move Down
                if (squares[southSquare][column].p.name == "X") {
                    squares[row][column].p.squaresAttacking.append((southSquare, column))
                    southSquare += 1
                } else {
                    if (squares[southSquare][column].p.color != piece.color) {
                        squares[row][column].p.squaresAttacking.append((southSquare, column))
                    }
                    
                    break;
                }
            }
            
            while (eastSquare <= 7) { //Lets Rook Move Right
                if (squares[row][eastSquare].p.name == "X") {
                    squares[row][column].p.squaresAttacking.append((row, eastSquare))
                    eastSquare += 1
                } else {
                    if (squares[row][eastSquare].p.color != piece.color) {
                        squares[row][column].p.squaresAttacking.append((row, eastSquare))
                    }
                    
                    break;
                }
            }
            
            while (westSquare >= 0) {
                if (squares[row][westSquare].p.name == "X") {
                    squares[row][column].p.squaresAttacking.append((row, westSquare))
                    westSquare -= 1
                } else {
                    if (squares[row][westSquare].p.color != piece.color) {
                        squares[row][column].p.squaresAttacking.append((row, westSquare))
                    }
                    
                    break;
                }
            }
            
        }
    }
    

    func movePiece(start: (Int, Int), end: (Int, Int)) {
        let piece = squares[start.0][start.1].p

        squares[start.0][start.1].p.name = "X"
        squares[end.0][end.1].p = piece
    }
    
    func canClick(pieceColor: String) -> Bool {
        if firstClick {
            if whitesTurn {
                if pieceColor == "W" {
                    return false
                } else {
                    return true
                }
            } else {
                if pieceColor == "B" {
                    return false
                } else {
                    return true
                }
            }
        }
        
        return false
    }
}

func displayColor(pieceColor: String) -> Color {
    if pieceColor == "W" {
        return Color.red
    } else {
        return Color.blue
    }
}

func placeColumn(column: Int) -> CGFloat {
    let multiplier = 50 * column
    return CGFloat(-175 - multiplier)
}

func placeRow(row: Int) -> CGFloat {
    let multiplier = 50 * row
    return CGFloat(-175 + multiplier)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      BoardView(pieceCoordinates: (0,0))
    }
}
