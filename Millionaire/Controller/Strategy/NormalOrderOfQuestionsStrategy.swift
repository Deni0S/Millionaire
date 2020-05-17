//
//  NormalOrderOfQuestionsStrategy.swift
//  Millionaire
//
//  Created by Денис Баринов on 17.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

final class NormalIndexOfQuestionStrategy: IndexOfQuestionStrategy {    
    func indexOfQuestion(askedQuestion: Int, countQuestion: Int) -> Int {
        return askedQuestion+1
    }
}
