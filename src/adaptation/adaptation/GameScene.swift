//
//  GameScene.swift
//  templateSpriteKit
//
//  Created by Simone Cioffi on 07/04/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var player = User()
    var endPosition: CGPoint = CGPoint()
    //    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
    var previousTime = TimeInterval()
    var floor: Maze?
    let playerSpeed = 2.1
    var randomObstacle = SKNode()
    var mySingleton: GameSingleton = GameSingleton.shared
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0)
        let instructionLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        instructionLabel.text = "Swipe to move the character"
        instructionLabel.fontSize = 45
        instructionLabel.fontColor = UIColor(red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
        instructionLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            instructionLabel.isHidden = true
        }
        self.addChild(instructionLabel)
        
        
        
        // Create maze
        floor = MazeLV1(m: 14, n: 8, scene: scene!)
        endPosition = (floor?.getEndPox())!
        // User Init
        player.UserInit(scene: scene!, start: (floor?.getStartPox())!)
        
        //Swipe
        swipeInitializer(view: view)
        scene?.addChild(randomObstacle)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (player.getUser().position.x > endPosition.x-21 && player.getUser().position.x < endPosition.x+25
            && player.getUser().position.y > endPosition.y-82 && player.getUser().position.y < endPosition.y+19) {
            // Player Win
            GameSingleton.shared.completeLevel()
        }
        
        let obstacles: [[SKSpriteNode?]] = floor!.getMatrix()
        if (previousTime>=0) {
            if ((Int) (currentTime - previousTime) > 6 - GameSingleton.shared.getCurrentLevel()) {
                randomObstacle.removeAllChildren()
                previousTime = currentTime
                for i in 2..<12 {
                    for j in 2..<6 {
                        if (obstacles[i][j] != nil) {
                            var randomObj = Float.random(in: 0...1)
                            if (randomObj >= 0.5){
                            if (obstacles[i + 1][j] == nil || obstacles[i - 1][j] == nil || obstacles[i][j - 1] == nil ||  obstacles[i][j + 1] == nil) {
                                var randomInteger = Int.random(in: 0...3)
                                switch randomInteger {
                                case 0:
                                    if (obstacles[i + 1][j] == nil && player.getUser().position != obstacles[i + 1][j]?.position) {
                                        let obstacleTileFloor = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        obstacleTileFloor.position.x = (obstacles[i][j]?.position.x)!
                                        obstacleTileFloor.position.y = (obstacles[i][j]?.position.y)!-100
                                        obstacleTileFloor.size = obstacles[i][j]!.size
                                        obstacleTileFloor.physicsBody = SKPhysicsBody(rectangleOf: obstacleTileFloor.size)
                                        obstacleTileFloor.physicsBody?.affectedByGravity = false
                                        obstacleTileFloor.physicsBody?.allowsRotation = false
                                        obstacleTileFloor.physicsBody?.isDynamic = false
                                        obstacleTileFloor.physicsBody?.restitution = 0
                                        randomObstacle.addChild(obstacleTileFloor)
                                    } else {
                                        randomInteger = randomInteger + 1
                                    }
                                case 1:
                                    if (obstacles[i - 1][j] == nil && player.getUser().position != obstacles[i - 1][j]?.position) {
                                        let obstacleTileFloor = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        obstacleTileFloor.position.x = (obstacles[i][j]?.position.x)!
                                        obstacleTileFloor.position.y = (obstacles[i][j]?.position.y)!+100
                                        obstacleTileFloor.size = obstacles[i][j]!.size
                                        obstacleTileFloor.physicsBody = SKPhysicsBody(rectangleOf: obstacleTileFloor.size)
                                        obstacleTileFloor.physicsBody?.affectedByGravity = false
                                        obstacleTileFloor.physicsBody?.allowsRotation = false
                                        obstacleTileFloor.physicsBody?.isDynamic = false
                                        obstacleTileFloor.physicsBody?.restitution = 0
                                        randomObstacle.addChild(obstacleTileFloor)
                                    }else {
                                        randomInteger = randomInteger + 1
                                    }
                                case 2:
                                    if (obstacles[i][j - 1] == nil && player.getUser().position != obstacles[i][j-1]?.position) {
                                        let obstacleTileFloor = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        obstacleTileFloor.position.x = (obstacles[i][j]?.position.x)!-100
                                        obstacleTileFloor.position.y = (obstacles[i][j]?.position.y)!
                                        obstacleTileFloor.size = obstacles[i][j]!.size
                                        obstacleTileFloor.physicsBody = SKPhysicsBody(rectangleOf: obstacleTileFloor.size)
                                        obstacleTileFloor.physicsBody?.affectedByGravity = false
                                        obstacleTileFloor.physicsBody?.allowsRotation = false
                                        obstacleTileFloor.physicsBody?.isDynamic = false
                                        obstacleTileFloor.physicsBody?.restitution = 0
                                        randomObstacle.addChild(obstacleTileFloor)
                                    } else {
                                        randomInteger = randomInteger + 1
                                    }
                                case 3:
                                    if (obstacles[i][j + 1] == nil && player.getUser().position != obstacles[i][j+1]?.position) {
                                        let obstacleTileFloor = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        obstacleTileFloor.position.x = (obstacles[i][j]?.position.x)!+100
                                        obstacleTileFloor.position.y = (obstacles[i][j]?.position.y)!
                                        obstacleTileFloor.size = obstacles[i][j]!.size
                                        obstacleTileFloor.physicsBody = SKPhysicsBody(rectangleOf: obstacleTileFloor.size)
                                        obstacleTileFloor.physicsBody?.affectedByGravity = false
                                        obstacleTileFloor.physicsBody?.allowsRotation = false
                                        obstacleTileFloor.physicsBody?.isDynamic = false
                                        obstacleTileFloor.physicsBody?.restitution = 0
                                        randomObstacle.addChild(obstacleTileFloor)
                                    } else {
                                        randomInteger = randomInteger + 1
                                    }
                                    
                                default:
                                    print("Error. Integer not corresponding to any case")
                                }
                            }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func swipeInitializer(view: SKView) {
        //Swipe
        let swiperRight = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipeRight(sender:)))
        swiperRight.direction = .right
        view.addGestureRecognizer(swiperRight)
        
        let swiperDown = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipeDown(sender:)))
        swiperDown.direction = .down
        view.addGestureRecognizer(swiperDown)
        
        let swiperUp = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipeUp(sender:)))
        swiperUp.direction = .up
        view.addGestureRecognizer(swiperUp)
        
        let swiperLeft = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipeLeft(sender:)))
        swiperLeft.direction = .left
        view.addGestureRecognizer(swiperLeft)
    }
    
    
    
    // @objc func
    @objc func swipeRight(sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Right");
        player.getUser().removeAllActions()
        player.getUser().physicsBody?.applyImpulse(CGVector(dx: 90.0, dy: 0.0))
    }
    
    @objc func swipeDown (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Dowm")
        player.getUser().removeAllActions()
        player.getUser().physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -90.0))
    }
    
    @objc func swipeUp (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Up")
        player.getUser().removeAllActions()
        player.getUser().physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 90.0))
    }
    
    @objc func swipeLeft (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Left")
        player.getUser().removeAllActions()
        player.getUser().physicsBody?.applyImpulse(CGVector(dx: -90.0, dy: 0.0))
    }
}


