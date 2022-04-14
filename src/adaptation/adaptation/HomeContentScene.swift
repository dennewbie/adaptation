//
//  HomeContentScene.swift
//  adaptation
//
//  Created by Denny Caruso on 14/04/22.
//

import SpriteKit

class HomeContentScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 253 / 255, green: 253 / 255, blue: 253 / 255, alpha: 1.0)
        let maleCharacter = SKSpriteNode(imageNamed: "maleCharacter")

        maleCharacter.size = CGSize(width: 520 / 5, height: 828 / 5)
        maleCharacter.position = CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + (self.frame.height / 2))
    
        let movementLeftToRight = SKAction.moveTo(x: self.frame.width, duration: 1.5)
        let movementRightToLeft = SKAction.moveTo(x: self.frame.origin.x, duration: 1.5)
        let mirror = SKAction.scaleX(to: -1.0, duration: 0.1)
        let mirrorBack = SKAction.scaleX(to: 1.0, duration: 0.1)
        
        let movementSequenceForMaleCharacter = SKAction.sequence([movementLeftToRight, mirror, movementRightToLeft, mirrorBack])
        maleCharacter.run(SKAction.repeatForever(movementSequenceForMaleCharacter))
        scene?.addChild(maleCharacter)
        scene?.size = self.view!.bounds.size
    }
}
