//
//  ChessSpeakApp.swift
//  ChessSpeak
//
//  Created by Daniel Madjar on 4/10/23.
//

import SwiftUI

@main
struct ChessSpeakApp: App {
    var body: some Scene {
        WindowGroup {
            BoardView(pieceCoordinates: (0, 0))
        }
    }
}
