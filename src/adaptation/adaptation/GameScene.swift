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
    var maze = SKSpriteNode()
    
    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
    var floor = [[SKSpriteNode?]](repeating: [SKSpriteNode?](repeating: nil, count: 20), count: 10)
    var previousTime = TimeInterval()
    var floors = SKNode()
// Matrix 10 x 20  Alternate PAtter floor
    
        
    let Speed = 2.1
    
    
    override func didMove(to view: SKView) {
        //Init
        Start = self.childNode(withName: "Start") as! SKSpriteNode
        End = self.childNode(withName: "End") as! SKSpriteNode
        maze = self.childNode(withName: "Maze/Floor") as! SKSpriteNode
    
        
        creatingmaze(m: 10, n: 20)
        scene?.addChild(floors)
        
        //User Init
        UserInit()
       
        //Cam Create
        cam.xScale = 0.5
        cam.yScale = 0.5
        User.addChild(cam)
        scene?.camera = cam
        
        let Settings = SKSpriteNode(imageNamed: "Setting")
        Settings.position = CGPoint(x: 325, y: 617)
        Settings.size = CGSize(width: 50, height: 50)
        cam.addChild(Settings)
        
        //Swipe
        SwipeInit(view: view)
        
        //creatingmaze
        creatingmaze(m: 10, n: 20)
        
    }
    
    func UserInit() {
        //User Create
        User = SKSpriteNode(imageNamed: "maleCharacter")
        User.size.height = 50
        User.size.width = 50
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
        User.run(SKAction.moveBy(x: maze.size.width , y:0, duration: speed))
    }
    
    @objc func swipeDown (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Dowm")
        User.removeAllActions()
        User.run(SKAction.moveBy(x: 0, y: -(maze.size.height*2), duration: speed*2))
    }
    
    @objc func swipeUp (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Up")
        User.removeAllActions()
        User.run(SKAction.moveBy(x: 0, y: (maze.size.height*2), duration: speed*2))
    }
    
    @objc func swipeLeft (sender: UISwipeGestureRecognizer){
        debugPrint("Swipe Left")
        User.removeAllActions()
        User.run(SKAction.moveBy(x: -maze.size.width , y: 0, duration: speed))
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        for i in 1...13 {
            obstacles.append(self.childNode(withName: "Maze/Obstacles/o\(i)") as! SKSpriteNode)
        }
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
        
    }
    
    func creatingmaze(m: Int, n: Int) {
        for i in 0..<m {
            for j in 0..<n {
                if (i == 0 && j == 0) {
                    floor[i][j] = Start
                    Start.position = CGPoint(x: (-328-(100*j)), y: (611-(100*i)))
                }
                
                if(i == n && j == m) {
                    floor[i][j] = End
                    End.position = CGPoint(x: (-328-(100*j)), y: (611-(100*i)))
                    
                }
                if (j%2 == 0) {
                    floor[i][j] = SKSpriteNode(imageNamed: "grayTileFloor")
                    floor[i][j]?.position = CGPoint(x: (-328-(100*j)), y: (611-(100*i)))
                    floors.addChild(floor[i][j]!)
                }
                else {
                    floor[i][j] = SKSpriteNode(imageNamed: "whiteTileFloor")
                    floor[i][j]?.position = CGPoint(x: (-328-(100*j)), y: (611-(100*i)))
                    floors.addChild(floor[i][j]!)
                }
                
            }
        }
    }
}
