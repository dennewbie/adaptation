//
//  HomeView.swift
//  adaptation
//
//  Created by Denny Caruso on 13/04/22.
//

import SwiftUI
import SpriteKit

struct TopBlock: View {
    let homeViewColorPlayButton: UIColor = UIColor( red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeViewColorSettingsButton: UIColor = UIColor( red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    let settingsSymbol: String = "gearshape.fill"
    let infoSymbol: String = "info.circle"
    let buttonWidth: CGFloat = 100
    let buttonHeigth: CGFloat = 100
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack{
            HStack {
                NavigationLink(destination: InfoView(), tag: 3, selection: $selectedButton) {
                    CustomButton(buttonAction: {
                        print("info button pressed")
                        self.selectedButton = 3
                    }, imageName: "info.circle", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .center, buttonColor: homeViewColorSettingsButton, systemImage: true)
                    .padding(.all, UIScreen.screenWidth / 12)
                }
                
                NavigationLink(destination: SettingsView(), tag: 1, selection: $selectedButton) {
                    CustomButton(buttonAction: {
                        print("settings button pressed")
                        self.selectedButton = 1
                    }, imageName: "gearshape.fill", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .trailing, buttonColor: homeViewColorSettingsButton, systemImage: true)
                    .padding(.all, UIScreen.screenWidth / 12)
                }
            }
            .frame(width: UIScreen.screenWidth, height: 100, alignment: .center)
            .padding(.top, 60)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .top)
    }
}

struct HomeSpriteView: View {
    var scene: SKScene {
        let scene = SKScene(fileNamed: "HomeContentScene")
        scene!.size = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2)
        scene?.scaleMode = .aspectFit
        return scene!
    }

    var body: some View {
        SpriteView(scene: scene)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CentralBlock: View {
    var body: some View {
        VStack {
            HomeSpriteView()
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2.5, alignment: .center)
            Text("Adaptation")
                .font(.system(size: 40, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3.5, alignment: .center)
    }
}

struct BottomBlock: View {
    let homeViewColorPlayButton: UIColor = UIColor( red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeViewColorSettingsButton: UIColor = UIColor( red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack {
            NavigationLink(destination: LevelsView(), tag: 2, selection: $selectedButton) {
                CustomButton(buttonAction: {
                    print("play button pressed")
                    self.selectedButton = 2
                }, imageName: "play.circle", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .bottom, buttonColor: homeViewColorPlayButton, systemImage: true)
                .padding(.bottom, 100)
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .bottom)
        }
    }
}

struct HomeView: View {
    @State private var soundVolume = UserDefaults.standard.float(forKey: "soundVolume")
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TopBlock()
                CentralBlock()
                BottomBlock()
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}
