//
//  GameCaretaker.swift
//  Millionaire
//
//  Created by Денис Баринов on 13.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import Foundation

final class GameCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    
    func save(records: [GameSession]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: "gameRecords")
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: "gameRecords") else {
            return []
        }
        do {
            return try decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
