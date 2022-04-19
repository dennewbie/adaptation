//
//  Maze_lv2.swift
//  adaptation
//
//  Created by Simone Cioffi on 17/04/22.
//

import Foundation
import SpriteKit

class MazeLV2 : Maze{
    private var obstacleNode = SKNode()
    private var obstaclesSpriteNodes: [[SKSpriteNode?]]
    private var startSpriteNode = SKSpriteNode()
    private var endSpriteNode = SKSpriteNode()
    private var startPosition: CGPoint
    private var endPosition: CGPoint
    
    override init(m: Int, n: Int, scene: SKScene) {
        self.obstaclesSpriteNodes =
        [[nil, nil, nil, nil, nil, nil, nil, nil, nil], // Walls
         [nil, SKSpriteNode(),SKSpriteNode(),SKSpriteNode(),SKSpriteNode(), nil, nil, nil, nil],
         [nil, nil, nil,nil, SKSpriteNode(), nil, SKSpriteNode(), SKSpriteNode(), nil],
         [nil, endSpriteNode, SKSpriteNode(), nil, nil, nil,nil, nil, nil],
         [nil, nil, SKSpriteNode(), nil, SKSpriteNode(), nil, nil, nil, nil],
         [nil, nil ,SKSpriteNode(), nil, SKSpriteNode(), nil, nil, SKSpriteNode(), nil],
         [nil, nil, nil, nil, nil, SKSpriteNode(), nil, SKSpriteNode(), nil ],
         [nil, nil, SKSpriteNode(), SKSpriteNode(), SKSpriteNode(), nil, SKSpriteNode(), nil, nil],
         [nil, SKSpriteNode(), nil, nil, SKSpriteNode(), nil, SKSpriteNode(), nil, nil],
         [nil, SKSpriteNode(), SKSpriteNode(), nil, nil, nil, SKSpriteNode(), nil, nil],
         [nil, SKSpriteNode(), SKSpriteNode(), nil, SKSpriteNode(), nil, nil, SKSpriteNode(), nil],
         [nil, nil, nil, nil, nil, nil, nil, nil, nil],
         [nil, nil, SKSpriteNode(), SKSpriteNode(), nil, SKSpriteNode(), nil,SKSpriteNode(),nil],
         [nil, startSpriteNode, SKSpriteNode(), nil, nil, nil, nil, nil, nil]
        ]
        startPosition = CGPoint()
        endPosition = CGPoint()
        
        super.init(m: m, n: n, scene: scene)
        // Init Obj Matrix
        for i in 1..<m {
            for j in 1..<n {
                if (obstaclesSpriteNodes[i][j] != nil
                    && obstaclesSpriteNodes[i][j] != startSpriteNode
                    && obstaclesSpriteNodes[i][j] != endSpriteNode) {
                    
                    obstaclesSpriteNodes[i][j] = SKSpriteNode(imageNamed: "obstacleTileFloor")
                    obstaclesSpriteNodes[i][j]?.position = CGPoint(x: (super.xPosition + (100 * j)), y: (super.yPosition - (100 * i)))
                    obstaclesSpriteNodes[i][j]?.size = CGSize(width: 95, height: 95)
                    //wall Physic
                    obstaclesSpriteNodes[i][j]?.physicsBody = SKPhysicsBody(texture:  (obstaclesSpriteNodes[i][j]?.texture)!, size:  obstaclesSpriteNodes[i][j]!.size)
                    obstaclesSpriteNodes[i][j]?.physicsBody?.affectedByGravity = false
                    obstaclesSpriteNodes[i][j]?.physicsBody?.allowsRotation = false
                    obstaclesSpriteNodes[i][j]?.physicsBody?.isDynamic = false
                    obstaclesSpriteNodes[i][j]?.physicsBody?.restitution = 0.0
                    
                    obstacleNode.addChild(obstaclesSpriteNodes[i][j]!)
                } else{
                    if (obstaclesSpriteNodes[i][j] == startSpriteNode){
                        startSpriteNode = SKSpriteNode(imageNamed: "Start")
                        startSpriteNode.size = CGSize(width: 100, height: 100)
                        startSpriteNode.position = CGPoint(x: (super.xPosition + (100 * j)), y: (super.yPosition - (100 * i)))
                        startPosition = CGPoint(x: (super.xPosition + (100 * j)), y: (super.yPosition - (100 * i)))
                        obstacleNode.addChild(startSpriteNode)
                    } else if(obstaclesSpriteNodes[i][j] == endSpriteNode) {
                        endSpriteNode = SKSpriteNode(imageNamed: "End")
                        endPosition = CGPoint(x: (super.xPosition + (100 * j)), y: (super.yPosition - (100 * i)))
                        endSpriteNode.size = CGSize(width: 100, height: 100)
                        endSpriteNode.position = CGPoint(x: (super.xPosition + (100 * j)), y: (super.yPosition - (100 * i)))
                        obstacleNode.addChild(endSpriteNode)
                    }
                }
            }
        }
        scene.addChild(obstacleNode)
    }
    
   override public func getStartPox() -> CGPoint {
        return startPosition
    }
    
    
   override public func getEndPox() -> CGPoint {
        return endPosition
    }
    
   override public func getMatrix() -> [[SKSpriteNode?]]{
        return obstaclesSpriteNodes
    }
    
   override public func deleteMatrix()  {
        obstacleNode.removeAllChildren()
    }
}

