//
//  GameScene.swift
//  templateSpriteKit
//
//  Created by Ignazio Finizio on 07/04/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var Player = User()
    var EndPox: CGPoint = CGPoint()
//    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
//    var previousTime = TimeInterval()
//
    let Speed = 2.1
    
    
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
        let floor = MazeLV1(m: 14, n: 8, scene: scene!)
        EndPox = floor.getEndPox()
        //User Init
        Player.UserInit(scene: scene!, start: floor.getStartPox())
        
        //Swipe
        SwipeInit(view: view)
    }
    override func update(_ currentTime: TimeInterval) {
        if (Player.getUser().position.x > EndPox.x-21 && Player.getUser().position.x < EndPox.x+19
            && Player.getUser().position.y > EndPox.y-82 && Player.getUser().position.y < EndPox.y+19)
        {
            //End Here
        }
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


