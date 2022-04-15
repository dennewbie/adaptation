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
    private var Start = SKSpriteNode()
    private var End = SKSpriteNode()
    private var StartPox: CGPoint
    private var EndPox: CGPoint
    
    override init(m: Int, n: Int, scene: SKScene){
        self.obst = [[nil,nil,nil,nil,nil,nil,nil,nil,nil], //Wall
                     [nil,nil,nil,SKSpriteNode(),nil,SKSpriteNode(),SKSpriteNode(),Start,nil],
                     [nil,nil,SKSpriteNode(),SKSpriteNode(),nil,SKSpriteNode(),SKSpriteNode(),nil,nil],
                     [nil,nil,nil,nil,nil,SKSpriteNode(),SKSpriteNode(),nil,nil],
                     [nil,SKSpriteNode(),SKSpriteNode(),SKSpriteNode(),nil,nil,nil,nil,nil],
                     [nil,SKSpriteNode(),nil,nil,nil,nil,SKSpriteNode(),SKSpriteNode(),nil],
                     [nil,nil,nil,SKSpriteNode(),nil,nil,SKSpriteNode(),End,nil],
                     [nil,nil,SKSpriteNode(),SKSpriteNode(),SKSpriteNode(),nil,SKSpriteNode(),nil,nil],
                     [nil,nil,nil,SKSpriteNode(),nil,nil,SKSpriteNode(),nil,nil],
                     [nil,SKSpriteNode(),nil,SKSpriteNode(),nil,nil,SKSpriteNode(),nil,nil],
                     [nil,nil,nil,SKSpriteNode(),nil,SKSpriteNode(),SKSpriteNode(),nil,nil],
                     [nil,nil,nil,nil,nil,nil,nil,nil,nil],
                     [nil,SKSpriteNode(),nil,SKSpriteNode(),SKSpriteNode(),nil,SKSpriteNode(),SKSpriteNode(),nil],
                     [nil,SKSpriteNode(),nil,nil,SKSpriteNode(),nil,nil,SKSpriteNode(),nil]
        ]
        StartPox = CGPoint()
        EndPox = CGPoint()
        //
        super.init(m: m, n: n, scene: scene)
        //Init Obj Matrix
        for i in 1..<m{
            for j in 1..<n{
                if (obst[i][j] != nil && obst[i][j] != Start  && obst[i][j] != End){
                    obst[i][j] = SKSpriteNode(imageNamed: "obstacleTileFloor")
                    obst[i][j]?.position = CGPoint(x: (super.xpos+(100*j)), y: (super.ypos-(100*i)))
                    obst[i][j]?.size = CGSize(width: 100, height: 100)
                    //wall Physic
                    obst[i][j]?.physicsBody = SKPhysicsBody(texture:  (obst[i][j]?.texture)!, size:  obst[i][j]!.size)
                    obst[i][j]?.physicsBody?.affectedByGravity = false
                    obst[i][j]?.physicsBody?.allowsRotation = false
                    obst[i][j]?.physicsBody?.isDynamic = false
                    obst[i][j]?.physicsBody?.restitution = 0.0
                     
                    Obst.addChild(obst[i][j]!)
                } else{
                    if (obst[i][j] == Start){
                        Start = SKSpriteNode(imageNamed: "Start")
                        Start.size = CGSize(width: 100, height: 100)
                        Start.position = CGPoint(x: (super.xpos+(100*j)), y: (super.ypos-(100*i)))
                        StartPox = CGPoint(x: (super.xpos+(100*j)), y: (super.ypos-(100*i)))
                        Obst.addChild(Start)
                    } else if(obst[i][j] == End) {
                        End = SKSpriteNode(imageNamed: "End")
                        EndPox = CGPoint(x: (super.xpos+(100*j)), y: (super.ypos-(100*i)))
                        End.size = CGSize(width: 100, height: 100)
                        End.position = CGPoint(x: (super.xpos+(100*j)), y: (super.ypos-(100*i)))
                        End.physicsBody?.categoryBitMask = UInt32(bitPattern: 5)
            
                        Obst.addChild(End)
                    }
                }
            }
        }
        scene.addChild(Obst)
    }
    
    public func getStartPox() -> CGPoint {
        return StartPox
    }
    
    
    public func getEndPox() -> CGPoint {
        return EndPox
    }
 
}
