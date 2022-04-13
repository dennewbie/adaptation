//
//  Maze_lv1.swift
//  adaptation
//
//  Created by Simone Cioffi on 13/04/22.
//

import Foundation
import SpriteKit

class MazeLV1 : Maze{
    private var Obst = SKNode()
    private var obst: [[SKSpriteNode?]]
    
    override init(m: Int, n: Int, scene: SKScene){
        self.obst = [[nil,nil,nil,SKSpriteNode(),nil,nil,nil,nil,nil],
                         [nil,nil,nil,SKSpriteNode(),nil,SKSpriteNode(),SKSpriteNode(),nil,nil]]
        //
        super.init(m: m, n: n, scene: scene)
        //Init Obj Matrix
        for i in 1..<m{
            for j in 1..<n{
                if (obst[i][j] != nil){
                    obst[i][j] = SKSpriteNode(imageNamed: "obstacleTileFloor")
                    obst[i][j]?.position = CGPoint(x: (super.xpos+(100*j)), y: (super.ypos-(100*i)))
                    obst[i][j]?.size = CGSize(width: 100, height: 100)
                    //wall Physic
                    obst[i][j]?.physicsBody = SKPhysicsBody(rectangleOf: obst[i][j]!.size)
                    obst[i][j]?.physicsBody?.affectedByGravity = false
                    obst[i][j]?.physicsBody?.allowsRotation = false
                    obst[i][j]?.physicsBody?.isDynamic = false
                    Obst.addChild(obst[i][j]!)
                }
            }
        }
        scene.addChild(Obst)
        //create floor
        
        //Create Obst
    }
}
