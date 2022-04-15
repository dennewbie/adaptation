//
//  ContentView.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct ContentView: View {
    @State static var sharedInstance: Bool = false {
        didSet {
            NotificationCenter.default.post(name: .showModal, object: ModalData(onDismiss: {
                print("Dismiss")
            }) { isPresented in
                ZStack {
                    WinContentView()
//                    Button("Click here to continue") {
//                          isPresented.wrappedValue = false
//                    }
                }
            })
        }
    }
    
    @State var audioPlayer: AVAudioPlayer?
    let contentViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
    init() {
        UINavigationBar.setAnimationsEnabled(false)
        UNUserNotificationCenter.current().removeAllDeliveredNotifications() // For removing all delivered notification
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    var scene: SKScene {
        let scene = SKScene(fileNamed: "GameScene")
        scene!.size = CGSize(width: 820, height: 1770)
        scene?.scaleMode = .aspectFit
        return scene!
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                SpriteView(scene: scene)
                    .edgesIgnoringSafeArea(.all)
                
                //                NavigationLink(destination: PauseView(), tag: 1, selection: $selectedButton) {
                //                    CustomButton(buttonAction: {
                //                        print("pause btn")
                //                        self.selectedButton = 1
                //                    }, imageName: "pause.circle", buttonHeight: 60, buttonWidth: 60, buttonAlignment: .center, buttonColor: contentViewColor, systemImage: true)
                //                    .position(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight - 70)
                //                }
                
                NavigationLink(destination: WinContentView(), tag: 2, selection: $selectedButton) {
                    Button(action: {
                        self.selectedButton = 2
                    }, label: {
                        // nothing
                    })
                    .frame(width: 1, height: 1, alignment: .bottom)
                }
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                //                playSound()
                audioPlayer?.numberOfLoops = 10000
                audioPlayer?.volume = UserDefaults.standard.float(forKey: "soundVolume")
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

public extension Notification.Name {
    static let showModal = Notification.Name("showModal")
}


struct ModalData {
    let onDismiss: (() -> Void)?
    let content: (Binding<Bool>) -> AnyView
    
    init<Content: View>(onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Binding<Bool>) -> Content) {
        self.onDismiss = onDismiss
        self.content = { AnyView(content($0)) }
    }
    
    static let empty = ModalData { _ in EmptyView() }
}
