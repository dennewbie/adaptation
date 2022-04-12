//
//  WinContentView.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct TopWinView: View {
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

struct WinContentView: View {
    let winViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeSymbol: String = String("house.circle")
    let playSymbol: String = String("play.circle")
    let buttonWidth: CGFloat = 80
    let buttonHeigth: CGFloat = 80
    let defaultViewBottomPadding: CGFloat = 30
    
    var body: some View {
        VStack {
            TopWinView()
            TwoHorizontalButtonsView(viewColor: winViewColor, firstButtonSymbol: homeSymbol, secondButtonSymbol: playSymbol, buttonsWidth: buttonWidth, buttonsHeigth: buttonHeigth, padding: defaultViewBottomPadding,
                firstButtonAction: {
                // navigation to home view
                print("home button clicked")
            }, secondButtonAction: {
                // navigation to the next level view
                print("play button clicked")
            })
        }
    }
}

struct WinContentView_Previews: PreviewProvider {
    static var previews: some View {
        WinContentView()
    }
}
