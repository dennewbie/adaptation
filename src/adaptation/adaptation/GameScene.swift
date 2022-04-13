//
//  GameScene.swift
//  templateSpriteKit
//
//  Created by Ignazio Finizio on 07/04/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var Start = SKSpriteNode()
    var End = SKSpriteNode()
    
    var User = SKSpriteNode()
    var cam = SKCameraNode()
    
    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
    
    var mazeSize = CGSize()
    var previousTime = TimeInterval()
    
    //Create Scene
    var floors = SKNode()
    var Obst = SKNode()
// Matrix 10 x 20  Alternate PAtter floor
    
        
    let Speed = 2.1
    
    
    override func didMove(to view: SKView) {
        //create maze
        creatingmaze(m: 14, n: 8)
        scene?.addChild(floors)
        
        //init obj
        ImplementObst(m: 14, n: 8)
        scene?.addChild(Obst)
        
        //User Init
        UserInit()
       
//        //Cam Create
//        cam.xScale = 0.7
//        cam.yScale = 0.7
//        User.addChild(cam)
//        scene?.camera = cam
        
        let Settings = SKSpriteNode(imageNamed: "Setting")
        Settings.position = CGPoint(x: 325, y: 617)
        Settings.size = CGSize(width: 50, height: 50)
        cam.addChild(Settings)
        
        //Swipe
        SwipeInit(view: view)
    }
    
    func UserInit() {
        //User Create
        User = SKSpriteNode(imageNamed: "maleCharacter")
        User.size.height = 60
        User.size.width = 60
        User.position = Start.position
        scene?.addChild(User)
        
        //User Physics
        User.physicsBody = SKPhysicsBody(rectangleOf: User.size)
        User.physicsBody?.affectedByGravity = false
        User.physicsBody?.collisionBitMask = 2
        User.physicsBody?.allowsRotation = false
        
    }
    
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
        User.removeAllActions()
        User.run(SKAction.moveBy(x: mazeSize.width , y:0, duration: speed))
    }
    
    @objc func swipeDown (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Dowm")
        User.removeAllActions()
        User.run(SKAction.moveBy(x: 0, y: -(mazeSize.height*2), duration: speed*2))
    }
    
    @objc func swipeUp (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Up")
        User.removeAllActions()
        User.run(SKAction.moveBy(x: 0, y: (mazeSize.height*2), duration: speed*2))
    }
    
    @objc func swipeLeft (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Left")
        User.removeAllActions()
        User.run(SKAction.moveBy(x: -mazeSize.width , y: 0, duration: speed))
    }
    
//
//    override func update(_ currentTime: TimeInterval) {
//        for i in 1...13 {
//            obstacles.append(self.childNode(withName: "Maze/Obstacles/o\(i)") as! SKSpriteNode)
//        }
//        if (previousTime>0){
//            if (currentTime - previousTime)>5{
//                previousTime = currentTime
//                for i in 1...13 {
//                    var xr = Int.random(in: -294...274)
//                    var yr = Int.random(in: -603...610)
//                    obstacles[i].position = CGPoint(x: CGFloat(xr), y: CGFloat(yr))
//                }
//
//            }
//
//        }else{
//            previousTime = currentTime
//
//        }
//
//    }
    
    func creatingmaze(m: Int, n: Int) {
        //reset mazew
        floors.removeAllChildren();
        //Position
        let xpos = -400
        let ypos = 700
        //init maze
        var floor = [[SKSpriteNode?]](repeating: [SKSpriteNode?](repeating: nil, count: n+1), count: m+1)
        //for loop init
        for i in 0..<m+1 {
            for j in 0..<n+1 {
                //Control for start & end
                if (i == 1 && j == 1) {
                    Start = SKSpriteNode(imageNamed: "confirmButton")
                    Start.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                    Start.size = CGSize(width: 100, height: 100)
                    scene?.addChild(Start)
                }
                
                if(i == m-1 && j == n-1) {
                    End = SKSpriteNode(imageNamed: "confirmButton")
                    End.position  = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                    End.size = CGSize(width: 100, height: 100)
                    scene?.addChild(End)
                }
                
                //Control for wall
                //i = 14 j = 8
                
                if (i == 0 || i == m){
                    floor[i][j] = SKSpriteNode(imageNamed: "Walls")
                    floor[i][j]?.size = CGSize(width: 100, height: 20)
                    if (i == 0) {
                        floor[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos-40-(100*i)))
                    } else {
                        floor[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos+40-(100*i)))
                    }
                    
                    //wall Physics
                    floor[i][j]?.physicsBody = SKPhysicsBody(rectangleOf: floor[i][j]!.size)
                    floor[i][j]?.physicsBody?.affectedByGravity = false
                    floor[i][j]?.physicsBody?.allowsRotation = false
                    floor[i][j]?.physicsBody?.isDynamic = false
                    floors.addChild(floor[i][j]!)
                }else if ( j == 0 || j == n){
                    floor[i][j] = SKSpriteNode(imageNamed: "Walls")
                    floor[i][j]?.size = CGSize(width: 20, height: 100)
                    if (j==0) {
                        floor[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                    } else {
                        floor[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                    }
                    
                    
                    //wall Physics
                    floor[i][j]?.physicsBody = SKPhysicsBody(rectangleOf: floor[i][j]!.size)
                    floor[i][j]?.physicsBody?.affectedByGravity = false
                    floor[i][j]?.physicsBody?.allowsRotation = false
                    floor[i][j]?.physicsBody?.isDynamic = false
                    floors.addChild(floor[i][j]!)
                } else {
                    //Control for floor placement
                    if (j%2 == 0 && i%2 == 0) {
                        floor[i][j] = SKSpriteNode(imageNamed: "grayTileFloor")
                        floor[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                        floor[i][j]?.size = CGSize(width: 100, height: 100)
                        floors.addChild(floor[i][j]!)
                    }
                    else {
                        if (j%2 == 1 && i%2 == 1){
                            floor[i][j] = SKSpriteNode(imageNamed: "grayTileFloor")
                        }else{
                        floor[i][j] = SKSpriteNode(imageNamed: "whiteTileFloor")
                        }
                        floor[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                        floor[i][j]?.size = CGSize(width: 100, height: 100)
                        floors.addChild(floor[i][j]!)
                    }

                }
            }
        }
        mazeSize = CGSize(width: 170*m+1, height: 170*m+1)
    }
    
    func ImplementObst(m: Int, n:Int){
        //creating Matrix for obj
        var obst = [[SKSpriteNode?]](repeating: [SKSpriteNode?](repeating: nil, count: n+1), count: m+1)
        //x & y
        let xpos = -400
        let ypos = 700
        //Init for
        for i in 1..<m{
            for j in 1..<n{
                if (Int.random(in: 1...100)>=69){
                    if (i == 1 && j == 1 || i == m && j == n){
                        
                    }else{
                        obst[i][j] = SKSpriteNode(imageNamed: "obstacleTileFloor")
                        obst[i][j]?.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                        obst[i][j]?.size = CGSize(width: 100, height: 100)
                        //wall Physics
                        obst[i][j]?.physicsBody = SKPhysicsBody(rectangleOf: obst[i][j]!.size)
                        obst[i][j]?.physicsBody?.affectedByGravity = false
                        obst[i][j]?.physicsBody?.allowsRotation = false
                        obst[i][j]?.physicsBody?.isDynamic = false
                        Obst.addChild(obst[i][j]!)
                    }
                }
            }
        }
    }
}


