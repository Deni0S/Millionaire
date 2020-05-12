//
//  Game.swift
//  Millionaire
//
//  Created by Денис Баринов on 12.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

class Game {
    static let shared = Game()
    var gameSession: GameSession?
    var gameHistory: [GameSession] = []
    let caretaker = GameCaretaker()
    
    private init() {}
    
    func addGameResult() {
        if gameSession != nil {
            gameHistory.append(gameSession!)
            caretaker.save(records: gameHistory)
        }
        gameSession = nil
    }
}
