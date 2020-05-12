//
//  GameSession.swift
//  Millionaire
//
//  Created by Денис Баринов on 12.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

class GameSession: Codable {
    var moneyWin: Int
    var allQuestions: Int
    var correctAnswer: Int
    var availableFriendAnswer: Bool
    var availableAudienceHelp: Bool
    
    init(moneyWin: Int, allQuestions: Int, correctAnswer: Int, availableFriendAnswer: Bool, availableAudienceHelp: Bool) {
        self.moneyWin = moneyWin
        self.allQuestions = allQuestions
        self.correctAnswer = correctAnswer
        self.availableFriendAnswer = availableFriendAnswer
        self.availableAudienceHelp = availableAudienceHelp
    }
}
