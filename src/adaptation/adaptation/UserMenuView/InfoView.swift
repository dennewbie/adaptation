//
//  InfoView.swift
//  adaptation
//
//  Created by Denny Caruso on 14/04/22.
//

import SwiftUI

struct InfoViewContent: View {
    let settingsViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let confirmSymbol: String = String("confirmButton")
    let buttonWidth: CGFloat = 60
    let buttonHeigth: CGFloat = 60
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack {
            TitleMenuView(titleLabelText: "Credits")
            Text("Music: \"A Sinister Puzzle\",\nfrom PlayOnLoop.com")
                .multilineTextAlignment(.center)
            Text("Sound effect: mixkit-arcade\n-mechanical-bling-210.wav")
                .multilineTextAlignment(.center)
            
            NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                CustomButton(buttonAction: {
                    print("confirm button pressed")
                    self.selectedButton = 1
                }, imageName: confirmSymbol, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .center, buttonColor: settingsViewColor, systemImage: false)
                .padding(.top, 25)
            }
        }
    }
}

struct InfoView: View {
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .opacity(0.15)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            Image("pauseView").resizable().frame(width: 350, height: 300, alignment: .center)
                                .overlay(InfoViewContent())
                        }
                    )
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}
