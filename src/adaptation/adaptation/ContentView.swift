//
//  ContentView.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var scene: SKScene {
        let scene = SKScene(fileNamed: "GameScene")
        scene!.size = CGSize(width: 820, height: 1770)
        scene?.scaleMode = .aspectFit
        return scene!
    }
    
    
    var body: some View {
        NavigationView {
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


