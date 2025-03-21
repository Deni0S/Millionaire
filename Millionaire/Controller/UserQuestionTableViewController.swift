import UIKit

enum UserQuestion {
    case question
}

enum UserAnswer {
    case answer
    case wrongAnswer1
    case wrongAnswer2
    case wrongAnswer3
}

struct UserQuestionArray {
    var userQuestion: UserQuestion
    var userAnswer: [UserAnswer]
}

class UserQuestionBuilder {
    private(set) var question: UserQuestion = .question
    private(set) var answer: UserAnswer = .answer
    private(set) var wrongAnswer1: UserAnswer = .wrongAnswer1
    private(set) var wrongAnswe2: UserAnswer = .wrongAnswer2
    private(set) var wrongAnswer3: UserAnswer = .wrongAnswer3

    func build () -> UserQuestionArray {
        return UserQuestionArray(userQuestion: question, userAnswer: [answer])
    }

    func setQuestion(_ question: UserQuestion) {
        self.question = question
    }


}

class UserQuestionTableViewController: UITableViewController {
    let userQuestionArray: [UserQuestionArray] = []

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
