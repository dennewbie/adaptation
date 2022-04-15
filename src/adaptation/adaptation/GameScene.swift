//
//  GameScene.swift
//  templateSpriteKit
//
//  Created by Simone Cioffi on 07/04/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var Player = User()
    var EndPox: CGPoint = CGPoint()
    //    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
    var previousTime = TimeInterval()
    var floor: MazeLV1?
    let Speed = 2.1
    var randomobst = SKNode()
    
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
        
        //create maze
        floor = MazeLV1(m: 14, n: 8, scene: scene!)
        EndPox = (floor?.getEndPox())!
        //User Init
        Player.UserInit(scene: scene!, start: (floor?.getStartPox())!)
        
        //Swipe
        SwipeInit(view: view)
        
        scene?.addChild(randomobst)
    }
    override func update(_ currentTime: TimeInterval) {
        if (Player.getUser().position.x > EndPox.x-21 && Player.getUser().position.x < EndPox.x+25
            && Player.getUser().position.y > EndPox.y-82 && Player.getUser().position.y < EndPox.y+19)
        {
            //End Here
            ContentView.sharedInstance = true
        }
        
        var obsta: [[SKSpriteNode?]] = floor!.getMatrix()
        if (previousTime>=0){
            if (currentTime - previousTime)>5{
                randomobst.removeAllChildren()
                previousTime = currentTime
                for i in 2..<12 {
                    for j in 2..<6 {
                        if (obsta[i][j] != nil) {
                            if ( obsta[i+1][j] == nil || obsta[i-1][j] == nil || obsta[i][j-1] == nil ||  obsta[i][j+1] == nil) {
                                var casuale = Int.random(in: 0...3)
                                debugPrint(casuale)
                                switch casuale {
                                case 0:
                                    if ( obsta[i+1][j] == nil && Player.getUser().position != obsta[i+1][j]?.position) {
                                        var a = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        a.position.x = (obsta[i][j]?.position.x)!
                                        a.position.y = (obsta[i][j]?.position.y)!-100
                                        a.size = obsta[i][j]!.size
                                        a.physicsBody = SKPhysicsBody(rectangleOf: a.size)
                                        a.physicsBody?.affectedByGravity = false
                                        a.physicsBody?.allowsRotation = false
                                        a.physicsBody?.isDynamic = false
                                        a.physicsBody?.restitution = 0
                                        
                                        randomobst.addChild(a)
                                        
                                        
                                    } else {
                                        casuale = casuale + 1
                                    }
                                case 1:
                                    if ( obsta[i-1][j] == nil && Player.getUser().position != obsta[i+1][j]?.position) {
                                        var a = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        a.position.x = (obsta[i][j]?.position.x)!
                                        a.position.y = (obsta[i][j]?.position.y)!+100
                                        a.size = obsta[i][j]!.size
                                        a.physicsBody = SKPhysicsBody(rectangleOf: a.size)
                                        a.physicsBody?.affectedByGravity = false
                                        a.physicsBody?.allowsRotation = false
                                        a.physicsBody?.isDynamic = false
                                        a.physicsBody?.restitution = 0
                                        randomobst.addChild(a)
                                        
                                    }else {
                                        casuale = casuale + 1
                                    }
                                case 2:
                                    if ( obsta[i][j-1] == nil && Player.getUser().position != obsta[i+1][j]?.position) {
                                        var a = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        a.position.x = (obsta[i][j]?.position.x)!-100
                                        a.position.y = (obsta[i][j]?.position.y)!
                                        a.size = obsta[i][j]!.size
                                        a.physicsBody = SKPhysicsBody(rectangleOf: a.size)
                                        a.physicsBody?.affectedByGravity = false
                                        a.physicsBody?.allowsRotation = false
                                        a.physicsBody?.isDynamic = false
                                        a.physicsBody?.restitution = 0
                                        randomobst.addChild(a)
                                        
                                    } else {
                                        casuale = casuale + 1
                                    }
                                case 3:
                                    if ( obsta[i][j+1] == nil && Player.getUser().position != obsta[i+1][j]?.position) {
                                        var a = SKSpriteNode(imageNamed: "obstacleTileFloor")
                                        a.position.x = (obsta[i][j]?.position.x)!+100
                                        a.position.y = (obsta[i][j]?.position.y)!
                                        a.size = obsta[i][j]!.size
                                        a.physicsBody = SKPhysicsBody(rectangleOf: a.size)
                                        a.physicsBody?.affectedByGravity = false
                                        a.physicsBody?.allowsRotation = false
                                        a.physicsBody?.isDynamic = false
                                        a.physicsBody?.restitution = 0
                                        randomobst.addChild(a)
                                        
                                        
                                    } else {
                                        casuale = casuale + 1
                                    }
                                    
                                default:
                                    print("boh")
                                }
                                
                            }
                        }
                    }
                }
            }
            
        }
        
    }
    
    
    /*  override func update(_ currentTime: TimeInterval) {
     
     var obsta: [[SKSpriteNode?]] == getMatrix()
     if (previousTime>0){
     if (currentTime - previousTime)>5{
     previousTime = currentTime
     for i in 1...13 {
     var xr = Int.random(in: -294...274)
     var yr = Int.random(in: -603...610)
     obstacles[i].position = CGPoint(x: CGFloat(xr), y: CGFloat(yr))
     }
     
     }
     
     }else{
     previousTime = currentTime
     
     }
     
     }*/
    func SwipeInit(view: SKView) {
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
    
    
    @objc func swipeRight(sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Right");
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: 90.0, dy: 0.0))
    }
    
    @objc func swipeDown (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Dowm")
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -90.0))
    }
    
    @objc func swipeUp (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Up")
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 90.0))
    }
    
    @objc func swipeLeft (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Left")
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: -90.0, dy: 0.0))
    }
    
    
}


