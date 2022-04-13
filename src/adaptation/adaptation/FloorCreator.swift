//
//  MazeCreator.swift
//  adaptation
//
//  Created by Simone Cioffi on 13/04/22.
//

import Foundation
import SpriteKit

class Maze{
    private var Start = SKSpriteNode(imageNamed: "confirmButton")
    private var End = SKSpriteNode(imageNamed: "confirmButton")
    private var floors = SKNode()
    internal let xpos = -400
    internal let ypos = 700

    private var mazeSize = CGSize()
    
    init(m: Int, n: Int, scene: SKScene) {
        //reset mazew
        floors.removeAllChildren();
        //init maze
        var floor = [[SKSpriteNode?]](repeating: [SKSpriteNode?](repeating: nil, count: n+1), count: m+1)
        //for loop init
        for i in 0..<m+1 {
            for j in 0..<n+1 {
                //Control for start & end
                if (i == 1 && j == 1) {
                    self.Start.position = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                    self.Start.size = CGSize(width: 100, height: 100)
                    scene.addChild(Start)
                }
                
                if(i == m-1 && j == n-1) {
                    self.End.position  = CGPoint(x: (xpos+(100*j)), y: (ypos-(100*i)))
                    self.End.size = CGSize(width: 100, height: 100)
                    scene.addChild(End)
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
                    floor[i][j]?.physicsBody?.restitution = 0
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
                    floor[i][j]?.physicsBody?.restitution = 0
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
        self.mazeSize = CGSize(width: 170*m+1, height: 170*m+1)
        scene.addChild(floors)
    }

    func getSize()-> CGSize{
        return mazeSize
    }
    
    func getStart()-> SKSpriteNode{
        return Start
    }
}



