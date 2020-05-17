//
//  GameViewController.swift
//  Millionaire
//
//  Created by Денис Баринов on 10.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import UIKit
import Foundation

protocol GameViewControllerDelegate: class {
    func didEndGame(withResult result: Int)
    func setMoneyWin(moneyWin: Int)
    func setCorrectAnswer(correctAnswer: Int)
    func setAvailableFriendAnswer(availableFriendAnswer: Bool)
    func setAvailableAudienceHelp(availableAudienceHelp: Bool)
}

class GameViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var friendAnswerButton: UIButton!
    @IBOutlet weak var audienceHelpButton: UIButton!
    @IBOutlet weak var askedQuestionLabel: UILabel!
    @IBOutlet weak var correctAnswerPercentageLabel: UILabel!
    
    
    var question: [Question] = [Question(question: "Сколько секунд в часе?", option1: "60", option2: "360", option3: "900", option4: "3600", answer: "3600", friendAnswer: "3600", audienceHelp: "3600"), Question(question: "Формула объема прямоугольного параллепипеда?", option1: "A*B/C", option2: "2*A*B*C", option3: "A*B*C", option4: "C/A*B", answer: "A*B*C", friendAnswer: "A*B*C", audienceHelp: "A*B*C"), Question(question: "Первый президент России?", option1: "Путин", option2: "Ельцин", option3: "Хрущев", option4: "Горбачев", answer: "Ельцин", friendAnswer: "Ельцин", audienceHelp: "Ельцин"), Question(question: "Столица Америки?", option1: "Нью-Йорк", option2: "Вашингтон", option3: "Лос-Анджелес", option4: "Балтимор", answer: "Вашингтон", friendAnswer: "Вашингтон", audienceHelp: "Вашингтон"), Question(question: "Сколько раз за 10 лет бывает високосный год?", option1: "1", option2: "2", option3: "3", option4: "4", answer: "2", friendAnswer: "2", audienceHelp: "2"), Question(question: "Автор серии книг о Простоквашино?", option1: "Эдуард Успенский", option2: "Эдвард Радзинский", option3: "Агния Барто", option4: "Пушкин", answer: "Эдуард Успенский", friendAnswer: "Эдуард Успенский", audienceHelp: "Эдуард Успенский"), Question(question: "Разница во времени между Москвой и Нью-Йорком?", option1: "+7 часов", option2: "-7 часов", option3: "+5 часов", option4: "-5 часов", answer: "-7 часов", friendAnswer: "-7 часов", audienceHelp: "-7 часов"), Question(question: "К какому семейству относится томаты?", option1: "Сложноцветные", option2: "Пасленовые", option3: "Крестоцветные", option4: "Злаковые", answer: "Пасленовые", friendAnswer: "Пасленовые", audienceHelp: "Пасленовые"), Question(question: "В каком году проведены первые Олимпийские игры?", option1: "7 апреля 1897 года", option2: "6 апреля 1896 года", option3: "4 февраля 1896 года", option4: "1 февраля 1884 года", answer: "6 апреля 1896 года", friendAnswer: "6 апреля 1896 года", audienceHelp: "6 апреля 1896 года"), Question(question: "Какое место в таблице Менделеева занимает Радий (Ra)?", option1: "88", option2: "90", option3: "47", option4: "95", answer: "88", friendAnswer: "88", audienceHelp: "88"), Question(question: "Какая общая длина Крымского моста?", option1: "10км", option2: "17км", option3: "19км", option4: "23км", answer: "19км", friendAnswer: "19км", audienceHelp: "19км"), Question(question: "В каком году Петр 1 стал императором?", option1: "1685", option2: "1671", option3: "1700", option4: "1721", answer: "1721", friendAnswer: "1721", audienceHelp: "1721"), Question(question: "Высота Эйфелевой башни?", option1: "284 метра", option2: "320 метров", option3: "324 метра", option4: "384 метра", answer: "324 метра", friendAnswer: "324 метра", audienceHelp: "324 метра"), Question(question: "Как Гюстав Эйфель называл Эйфелеву башню?" , option1: "300 метровая башня", option2: "башня", option3: "Эйфилевая", option4: "Гюстовка", answer: "300 метровая башня", friendAnswer: "300 метровая башня", audienceHelp: "300 метровая башня"), Question(question: "Где находится статуя свободы?", option1: "Филадельфия", option2: "Голливуд", option3: "Сан-Франциско", option4: "Нью-Йорк", answer: "Нью-Йорк", friendAnswer: "Нью-Йорк", audienceHelp: "Нью-Йорк"), Question(question: "Как звали почтальона Печкина?", option1: "Михалыч", option2: "Игорь Михайлович", option3: "Игорь Иванович", option4: "Валентин Печкин", answer: "Игорь Иванович", friendAnswer: "Игорь Иванович", audienceHelp: "Игорь Иванович")]
    var indexQuestion = 0
    var askedQuestion = Observable<Int>(0)
    var correctAnswer = 0
    var isGoToNextQuestion: Bool = false
    weak var gameDelegate: GameSceneDelegate?
    weak var delegate: GameViewControllerDelegate?
    var orderOfQuestions = Game.shared.gameOrderOfQuestions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        friendAnswerButton.addTarget(self, action: #selector(friendAnswerButtonOnTap), for: .touchDown)
        audienceHelpButton.addTarget(self, action: #selector(audienceHelpButtonOnTap), for: .touchDown)
        option1Button.addTarget(self, action: #selector(option1ButtonOnTap), for: .touchDown)
        option2Button.addTarget(self, action: #selector(option2ButtonOnTap), for: .touchDown)
        option3Button.addTarget(self, action: #selector(option3ButtonOnTap), for: .touchDown)
        option4Button.addTarget(self, action: #selector(option4ButtonOnTap), for: .touchDown)
        gameDelegate = self
        askedQuestion.addObserver(self, options: [.new, .initial]) { [weak self] (askedQuestion, _) in
            self?.askedQuestionLabel.text = "\(askedQuestion)"
            let correctAnswerPercentage = askedQuestion * 100 / (self?.question.count)!
            self?.correctAnswerPercentageLabel.text = "\(correctAnswerPercentage)%"
        }
    }
    
    func startGame() {
        indexQuestion = self.createIndexOfQuestionStrategy.indexOfQuestion(askedQuestion: self.askedQuestion.value, countQuestion: self.question.count)
        questionLabel.text = question[indexQuestion].question
        option1Button.setTitle(question[indexQuestion].option1 , for: UIControl.State())
        option2Button.setTitle(question[indexQuestion].option2, for: UIControl.State())
        option3Button.setTitle(question[indexQuestion].option3, for: UIControl.State())
        option4Button.setTitle(question[indexQuestion].option4, for: UIControl.State())
        Game.shared.gameSession = GameSession(moneyWin: 0, allQuestions: question.count, correctAnswer: 0, availableFriendAnswer: true, availableAudienceHelp: true)
    }
    
    @objc func friendAnswerButtonOnTap() {
        friendAnswerButton.isHidden = true
        self.delegate?.setAvailableFriendAnswer(availableFriendAnswer: false)
        Game.shared.gameSession?.availableFriendAnswer = false
        let alert = UIAlertController(title: "Я думаю это:", message: question[indexQuestion].friendAnswer, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Спасибо", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func audienceHelpButtonOnTap() {
        audienceHelpButton.isHidden = true
        self.delegate?.setAvailableFriendAnswer(availableFriendAnswer: false)
        Game.shared.gameSession?.availableAudienceHelp = false
        let alert = UIAlertController(title: "Зал единогласно решил что это:", message: question[indexQuestion].audienceHelp, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Спасибо", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func option1ButtonOnTap() {
        if !isGoToNextQuestion {
            isGoToNextQuestion = true
            if question[indexQuestion].option1 != question[indexQuestion].answer, question.count > indexQuestion+1 {
                option1Button.backgroundColor = .red
                gameDelegate?.didEndGame(withResult: correctAnswer)
            } else {
                correctAnswer += 1
                delegate?.setCorrectAnswer(correctAnswer: correctAnswer)
                delegate?.setMoneyWin(moneyWin: correctAnswer*10000)
            }
            nextQuestion()
        }
    }
    
    @objc func option2ButtonOnTap() {
        if !isGoToNextQuestion {
            isGoToNextQuestion = true
            if question[indexQuestion].option2 != question[indexQuestion].answer, question.count > indexQuestion+1 {
                option2Button.backgroundColor = .red
                gameDelegate?.didEndGame(withResult: correctAnswer)
            } else {
                correctAnswer += 1
                delegate?.setCorrectAnswer(correctAnswer: correctAnswer)
                delegate?.setMoneyWin(moneyWin: correctAnswer*10000)
            }
            nextQuestion()
        }
    }
    
    @objc func option3ButtonOnTap() {
        if !isGoToNextQuestion {
            isGoToNextQuestion = true
            if question[indexQuestion].option3 != question[indexQuestion].answer, question.count > indexQuestion+1 {
                option3Button.backgroundColor = .red
                gameDelegate?.didEndGame(withResult: correctAnswer)
            } else {
                correctAnswer += 1
                delegate?.setCorrectAnswer(correctAnswer: correctAnswer)
                delegate?.setMoneyWin(moneyWin: correctAnswer*10000)
            }
            nextQuestion()
        }
    }
    
    @objc func option4ButtonOnTap() {
        if !isGoToNextQuestion {
            isGoToNextQuestion = true
            if question[indexQuestion].option4 != question[indexQuestion].answer, question.count > indexQuestion+1 {
                option4Button.backgroundColor = .red
                gameDelegate?.didEndGame(withResult: correctAnswer)
            } else {
                correctAnswer += 1
                delegate?.setCorrectAnswer(correctAnswer: correctAnswer)
                delegate?.setMoneyWin(moneyWin: correctAnswer*10000)
            }
            nextQuestion()
        }
    }
    
    func nextQuestion() {
        if question[indexQuestion].option1 == question[indexQuestion].answer {
            option1Button.backgroundColor = .green
        } else if question[indexQuestion].option2 == question[indexQuestion].answer {
            option2Button.backgroundColor = .green
        } else if question[indexQuestion].option3 == question[indexQuestion].answer {
            option3Button.backgroundColor = .green
        } else if question[indexQuestion].option4 == question[indexQuestion].answer {
            option4Button.backgroundColor = .green
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.question.count > self.askedQuestion.value+1 {
                self.askedQuestion.value += 1
                self.indexQuestion =
                self.createIndexOfQuestionStrategy.indexOfQuestion(askedQuestion: self.askedQuestion.value, countQuestion: self.question.count)
                self.questionLabel.text = self.question[self.indexQuestion].question
                self.option1Button.setTitle(self.question[self.indexQuestion].option1 , for: UIControl.State())
                self.option2Button.setTitle(self.question[self.indexQuestion].option2 , for: UIControl.State())
                self.option3Button.setTitle(self.question[self.indexQuestion].option3 , for: UIControl.State())
                self.option4Button.setTitle(self.question[self.indexQuestion].option4 , for: UIControl.State())
                self.option1Button.backgroundColor = .systemBlue
                self.option2Button.backgroundColor = .systemBlue
                self.option3Button.backgroundColor = .systemBlue
                self.option4Button.backgroundColor = .systemBlue
                self.isGoToNextQuestion = false
            } else {
                self.gameDelegate?.didEndGame(withResult: self.correctAnswer)
            }
        }
    }
    
    private var createIndexOfQuestionStrategy: IndexOfQuestionStrategy {
        switch self.orderOfQuestions {
        case .normal:
            return NormalIndexOfQuestionStrategy()
        case .random:
            return RandomIndexOfQuestionStrategy()
        }
    }
}

extension GameViewController: GameSceneDelegate {
    func didEndGame(withResult result: Int) {
        delegate?.didEndGame(withResult: result)
        Game.shared.addGameResult()
        dismiss(animated: true, completion: nil)
    }
}
