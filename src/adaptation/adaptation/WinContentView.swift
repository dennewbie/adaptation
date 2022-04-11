//
//  WinContentView.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct WinContentView: View {
    var scene: SKScene {
        let scene = SKScene(fileNamed: "WinContentScene")
        scene!.size = CGSize(width: 750, height: 1334)
        scene?.scaleMode = .aspectFit
        return scene!
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .edgesIgnoringSafeArea(.all)

    }
}



struct WinContentView_Previews: PreviewProvider {
    static var previews: some View {
        WinContentView()
    }
}
