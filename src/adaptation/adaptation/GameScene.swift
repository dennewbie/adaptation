//
//  GameScene.swift
//  templateSpriteKit
//
//  Created by Ignazio Finizio on 07/04/22.
//

import SpriteKit

class GameScene: SKScene {
    var Start = SKSpriteNode()
    var End = SKSpriteNode()
    var User = SKSpriteNode()
    var cam = SKCameraNode()
    var maze = SKSpriteNode()
    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
    var previousTime = TimeInterval()
    
    let Speed = 2.1

    
    override func didMove(to view: SKView) {
        //Init
        Start = self.childNode(withName: "Start") as! SKSpriteNode
        End = self.childNode(withName: "End") as! SKSpriteNode
        maze = self.childNode(withName: "Maze/Floor") as! SKSpriteNode
    
        
        //User Init
        UserInit()
       
        //Cam Create
        cam.xScale = 0.5
        cam.yScale = 0.5
        User.addChild(cam)
        scene?.camera = cam
        
        //Swipe Init
        SwipeInit(view: view)
    }
    
    func UserInit() {
        //User Create
        User = SKSpriteNode(color: SKColor.cyan, size: CGSize(width: 50, height: 53))
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
    
    
    /*override func update(_ currentTime: TimeInterval) {
        for i in 1...13 {
            obstacles.append(self.childNode(withName: "o\(i)") as! SKSpriteNode)
        }
        if (previousTime>0){
            if (currentTime - previousTime)>1{
                previousTime = currentTime
                for i in 1...13 {
                    obstacles[i].position = CGPoint(x: frame.midX - 100, y: frame.midY - 100)
                }
                
            }
            
        }else{
            previousTime = currentTime
            
        }
        
    }*/
}
