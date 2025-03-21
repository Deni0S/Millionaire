import Foundation

class Game {
    static let shared = Game()
    var gameSession: GameSession?
    var gameHistory: [GameSession] = []
    let caretaker = GameCaretaker()
    var gameOrderOfQuestions: OrderOfQuestions = .normal

    private init() {}

    func addGameResult() {
        if gameSession != nil {
            gameHistory.append(gameSession!)
            caretaker.save(records: gameHistory)
        }
        gameSession = nil
    }
}
