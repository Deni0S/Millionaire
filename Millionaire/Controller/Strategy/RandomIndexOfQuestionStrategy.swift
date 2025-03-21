import Foundation

final class RandomIndexOfQuestionStrategy: IndexOfQuestionStrategy {
    func indexOfQuestion(askedQuestion: Int, countQuestion: Int) -> Int {
        return Int.random(in: 0...(countQuestion-1))
    }
}
