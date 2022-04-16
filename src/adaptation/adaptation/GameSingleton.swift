//
//  GameSingleton.swift
//  adaptation
//
//  Created by Denny Caruso on 16/04/22.
//

import Foundation

class GameSingleton {
    static let shared = GameSingleton()
    private var levelCompleted: Bool = false
    private var currentLevel: Int = 1
    
    //Initializer access level change now
    private init() { }
    
    func completeLevel() {
        levelCompleted = true
    }
    
    func initLevel() {
        levelCompleted = false
    }
    
    func setCurrentLevel(newCurrentLevel: Int) {
        currentLevel = newCurrentLevel
    }
    
    func getCurrentLevel() -> Int {
        return currentLevel
    }
    
    func isLevelComplete() -> Bool {
        return levelCompleted
    }
    
    func unlockNextLevel() {
        currentLevel = currentLevel + 1
    }
}
