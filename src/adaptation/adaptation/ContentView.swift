//
//  ContentView.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI
import SpriteKit
import AVFoundation
import Combine

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var audioPlayer: AVAudioPlayer?
    let contentViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
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
            VStack {
                VStack {
                    SpriteView(scene: scene)
                        .edgesIgnoringSafeArea(.all)
                }
                .position(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 2)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                
                VStack {
                    NavigationLink(destination: PauseView(), tag: 40, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("pause btn")
                            self.selectedButton = 40
                        }, imageName: "pause.circle", buttonHeight: 60, buttonWidth: 60, buttonAlignment: .center, buttonColor: contentViewColor, systemImage: true)
                    }
                }
                .position(x: UIScreen.screenWidth / 2, y: -70)
                .frame(width: UIScreen.screenWidth, height: 70, alignment: .center)
                
                NavigationLink(destination: WinContentView(), tag: 41, selection: $selectedButton) {
                    EmptyView()
                }
            }
            .onReceive(timer, perform: { _ in
                if (GameSingleton.shared.isLevelComplete()) {
                    self.selectedButton = 41
                }
            })
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                playSound()
                audioPlayer?.numberOfLoops = 10000
                audioPlayer?.volume = UserDefaults.standard.float(forKey: "soundVolume")
            })
            .onDisappear(perform: {
                audioPlayer?.stop()
            })
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
        
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "musicGame", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.textSwitch.toggle()
            }
        }
    }
}
