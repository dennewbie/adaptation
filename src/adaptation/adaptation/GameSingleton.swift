//
//  GameSingleton.swift
//  adaptation
//
//  Created by Denny Caruso on 16/04/22.
//

import Foundation

class GameSingleton {
    static let shared = GameSingleton()
    var levelCompleted: Bool = false
    var currentLevel: Int = 1
    //Initializer access level change now
    private init() { }
    
    func completeLevel() {
        levelCompleted = true
    }
    
    func isLevelComplete() -> Bool {
        return levelCompleted
    }
    
    func initLevel() {
        levelCompleted = false
    }
}
