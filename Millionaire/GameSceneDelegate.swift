//
//  GameSceneDelegate.swift
//  Millionaire
//
//  Created by Денис Баринов on 11.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

protocol GameSceneDelegate: class {
    func didEndGame(withResult result: Int)
}
