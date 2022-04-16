//
//  User.swift
//  adaptation
//
//  Created by Simone Cioffi on 13/04/22.
//

import Foundation
import SpriteKit

struct User{
    private var user =  SKSpriteNode()
    private var cam = SKCameraNode()
    
    mutating func UserInit(scene: SKScene,start: CGPoint) {
        // User Create
        self.user = SKSpriteNode(imageNamed: "mazeCharacter")
        user.size.height = 60
        user.size.width = 60
        user.name = "User"
        user.position = start
        //user.position = Start.position
        scene.addChild(user)
        
        //User Physics
        user.physicsBody = SKPhysicsBody(texture: user.texture!, size: user.size)
        user.physicsBody?.affectedByGravity = false
        user.physicsBody?.collisionBitMask = 2
        user.physicsBody?.allowsRotation = false
        user.physicsBody?.restitution = 0
        user.physicsBody?.categoryBitMask = UInt32(bitPattern: 5)
        
    }
    
    func getUser() -> SKSpriteNode{
        return user
    }
}
