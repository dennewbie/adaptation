//
//  GameScene.swift
//  templateSpriteKit
//
//  Created by Ignazio Finizio on 07/04/22.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene, SKPhysicsContactDelegate{
    var Player = User()
    var point: CGPoint? = nœil
//    var obstacles :[SKSpriteNode] = [SKSpriteNode]()
//    var previousTime = TimeInterval()
//
    let Speed = 2.1
    
    override func didMove(to view: SKView) {

        //create maze
        let floor = MazeLV1(m: 14, n: 8, scene: scene!)
        point = floor.getEndPox()
        //User Init
        Player.UserInit(scene: scene!, start: floor.getStartPox())
        
        //Swipe
        SwipeInit(view: view)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == UInt32(bitPattern: 5) || contact.bodyB.categoryBitMask == UInt32(bitPattern: 5){
            debugPrint("we")
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
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: 90.0, dy: 0.0))
    }

    @objc func swipeDown (sender: UISwipeGestureRecognizer){
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -90.0))
    }

    @objc func swipeUp (sender: UISwipeGestureRecognizer){
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 90.0))
    }

    @objc func swipeLeft (sender: UISwipeGestureRecognizer){
        Player.getUser().removeAllActions()
        Player.getUser().physicsBody?.applyImpulse(CGVector(dx: -90.0, dy: 0.0))
    }

    
}


