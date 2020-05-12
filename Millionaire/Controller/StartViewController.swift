//
//  StartViewController.swift
//  Millionaire
//
//  Created by Денис Баринов on 10.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import UIKit
import Foundation

class StartViewController: UIViewController {
    @IBOutlet weak var gameResultLabel: UILabel!
    let caretaker = GameCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.gameHistory = caretaker.retrieveRecords()
        gameResultLabel.text = "Верных ответов в предыдущей игре: \(Game.shared.gameHistory.last?.correctAnswer ?? 0)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
        default:
            break
        }
    }
}

extension StartViewController: GameViewControllerDelegate {
    func setMoneyWin(moneyWin: Int) {
        Game.shared.gameSession?.moneyWin = moneyWin
    }
    
    func setCorrectAnswer(correctAnswer: Int) {
        Game.shared.gameSession?.correctAnswer = correctAnswer
    }
    
    func setAvailableFriendAnswer(availableFriendAnswer: Bool) {
        Game.shared.gameSession?.availableFriendAnswer = availableFriendAnswer
    }
    
    func setAvailableAudienceHelp(availableAudienceHelp: Bool) {
        Game.shared.gameSession?.availableAudienceHelp = availableAudienceHelp
    }
    
    func didEndGame(withResult result: Int) {
        gameResultLabel.text = "Верных ответов в предыдущей игре: \(result)"
    }
}
