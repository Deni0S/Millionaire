import Foundation

final class NormalIndexOfQuestionStrategy: IndexOfQuestionStrategy {    
    func indexOfQuestion(askedQuestion: Int, countQuestion: Int) -> Int {
        return askedQuestion+1
    }
}
