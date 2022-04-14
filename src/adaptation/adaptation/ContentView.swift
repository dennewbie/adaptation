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
        scene!.size = CGSize(width: 820, height: 1670)
        scene?.scaleMode = .aspectFit
        return scene!
    }
    
    
    var body: some View {
        VStack {
            NavigationView {
                SpriteView(scene: scene)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitle("Title")
            .navigationBarHidden(true)
            
            LabelView()
        }
    }
}

struct LabelView: View {
    @State private var textSwitch = false
    
    var body: some View {
        VStack {
            Text((textSwitch ? "" : "Swipe to move the character"))
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(Color(red: 37 / 255, green: 17 / 255, blue: 97 / 255))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.textSwitch.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


