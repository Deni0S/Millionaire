//
//  SettingViewController.swift
//  Millionaire
//
//  Created by Денис Баринов on 17.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var orderOfQuestionsControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch Game.shared.gameOrderOfQuestions {
        case .normal:
            orderOfQuestionsControl.selectedSegmentIndex = 0
        case .random:
            orderOfQuestionsControl.selectedSegmentIndex = 1
        }
        orderOfQuestionsControl.addTarget(self, action: #selector(orderOfQuestionsControlOnTap), for: .valueChanged)
    }
    
    @objc func orderOfQuestionsControlOnTap() {
        switch self.orderOfQuestionsControl.selectedSegmentIndex {
        case 0:
            Game.shared.gameOrderOfQuestions = .normal
        case 1:
            Game.shared.gameOrderOfQuestions = .random
        default:
            return
        }
        
    }
}
