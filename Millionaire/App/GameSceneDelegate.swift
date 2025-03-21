import Foundation

protocol GameSceneDelegate: AnyObject {
    func didEndGame(withResult result: Int)
}
