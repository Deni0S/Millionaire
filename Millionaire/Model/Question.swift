//
//  Question.swift
//  Millionaire
//
//  Created by Денис Баринов on 10.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import UIKit

struct Question {
    var question: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    var answer: String
    var friendAnswer: String
    var audienceHelp: String
    
    init(question: String, option1: String, option2: String, option3: String, option4: String, answer: String, friendAnswer: String, audienceHelp: String) {
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answer = answer
        self.friendAnswer = friendAnswer
        self.audienceHelp = audienceHelp
    }
}
