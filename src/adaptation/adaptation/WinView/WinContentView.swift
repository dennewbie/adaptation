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
    @State private var selectedButton: Int? = nil
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
        if (GameSingleton.shared.isLevelComplete()) {
            GameSingleton.shared.initLevel()
            GameSingleton.shared.unlockNextLevel()
            print("\nCURRENT LEVEL: \(GameSingleton.shared.getCurrentLevel())")
            let availableLevels: [Bool] = UserDefaults.standard.array(forKey: "availableLevels") as? [Bool] ?? [Bool]()
            var newAvailableLevels: [Bool] = [availableLevels[0], availableLevels[1], availableLevels[2], availableLevels[3]]
            if ((GameSingleton.shared.getCurrentLevel() - 1) < newAvailableLevels.count) {
                newAvailableLevels[GameSingleton.shared.getCurrentLevel() - 1] = true
                UserDefaults.standard.set(newAvailableLevels, forKey: "availableLevels")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TopWinView()
                HStack {
                    NavigationLink(destination: HomeView(), tag: 10, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("home button pressed")
                            self.selectedButton = 10
                        }, imageName: homeSymbol, buttonHeight: 100, buttonWidth: 100, buttonAlignment: .center, buttonColor: winViewColor, systemImage: true)
                    }
                    
                    NavigationLink(destination: LevelsView(), tag: 11, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("levels button pressed")
                            self.selectedButton = 11
                        }, imageName: playSymbol, buttonHeight: 100, buttonWidth: 100, buttonAlignment: .trailing, buttonColor: winViewColor, systemImage: true)
                    }
                }
                .frame(width: UIScreen.screenWidth, height: 100, alignment: .center)
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}
