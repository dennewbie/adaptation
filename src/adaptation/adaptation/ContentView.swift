//
//  ContentView.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI
import SpriteKit
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

struct ContentView: View {
    let contentViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var scene: SKScene {
        let scene = SKScene(fileNamed: "GameScene")
        scene!.size = CGSize(width: 820, height: 1570)
        scene?.scaleMode = .aspectFit
        return scene!
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    NavigationLink(destination: PauseView(), tag: 2, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("pause button clicked")
                            self.selectedButton = 2
                            audioPlayer?.stop()
                        }, imageName: "pause.circle", buttonHeight: 60, buttonWidth: 60, buttonAlignment: .topTrailing, buttonColor: contentViewColor, systemImage: true)
                    }
                }
                .frame(width: UIScreen.screenWidth, height: 60, alignment: .topTrailing)
                
                
                VStack {
                    SpriteView(scene: scene)
                        .edgesIgnoringSafeArea(.all)
                }
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 250, alignment: .center)
                
                VStack {
                    LabelView()
                }
                .frame(width: UIScreen.screenWidth, height: 50, alignment: .bottom)
                .padding(.bottom, 20)
            }
            .onAppear(perform: {
                playSound(sound: "musicGame", type: "wav")
                audioPlayer?.numberOfLoops = 100
                audioPlayer?.volume = 0.5
            })
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
        
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



