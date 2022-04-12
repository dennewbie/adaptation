//
//  WinContentScene.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SpriteKit

class WinContentScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 253 / 255, green: 253 / 255, blue: 253 / 255, alpha: 1.0)
        let maleCharacter = SKSpriteNode(imageNamed: "maleCharacter")
        let femaleCharacter = SKSpriteNode(imageNamed: "femaleCharacter")

        maleCharacter.size = CGSize(width: 520 / 6, height: 828 / 6)
        femaleCharacter.size = CGSize(width: 520 / 6, height: 828 / 6)
        maleCharacter.position = CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + (self.frame.height / 2.5))
        femaleCharacter.position = CGPoint(x: self.frame.maxX, y: self.frame.maxY - (self.frame.height / 2.5))
    
        let movementLeftToRight = SKAction.moveTo(x: self.frame.width, duration: 1.5)
        let movementRightToLeft = SKAction.moveTo(x: self.frame.origin.x, duration: 1.5)
        let mirror = SKAction.scaleX(to: -1.0, duration: 0.1)
        let mirrorBack = SKAction.scaleX(to: 1.0, duration: 0.1)
        
        let winnerLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        winnerLabel.text = "🎉 You Win! 🎉"
        winnerLabel.fontSize = 35
        winnerLabel.fontColor = UIColor(red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
        winnerLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(winnerLabel)
        
        let movementSequenceForMaleCharacter = SKAction.sequence([movementLeftToRight, mirror, movementRightToLeft, mirrorBack])
        let movementSequenceForFemaleCharacter = SKAction.sequence([mirror, movementRightToLeft, mirrorBack, movementLeftToRight])
        maleCharacter.run(SKAction.repeatForever(movementSequenceForMaleCharacter))
        femaleCharacter.run(SKAction.repeatForever(movementSequenceForFemaleCharacter))
        scene?.addChild(maleCharacter)
        scene?.addChild(femaleCharacter)
        scene?.size = self.view!.bounds.size
    }
}
