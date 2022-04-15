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
        UNUserNotificationCenter.current().removeAllDeliveredNotifications() // For removing all delivered notification
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TopWinView()
                HStack {
                    NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("home button pressed")
                            self.selectedButton = 1
                        }, imageName: homeSymbol, buttonHeight: 100, buttonWidth: 100, buttonAlignment: .center, buttonColor: winViewColor, systemImage: true)
                    }
                    
                    NavigationLink(destination: LevelsView(), tag: 2, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("levels button pressed")
                            self.selectedButton = 2
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

struct WinContentView_Previews: PreviewProvider {
    static var previews: some View {
        WinContentView()
    }
}
