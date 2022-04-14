//
//  PauseView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct PauseViewContent: View {
    let pauseViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeSymbol: String = String("house.circle")
    let playSymbol: String = String("play.circle")
    let buttonWidth: CGFloat = 60
    let buttonHeigth: CGFloat = 60
    let defaultViewBottomPadding: CGFloat = 0
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack {
            TitleMenuView(titleLabelText: "Pause")
            SliderView(sliderOptionLabelText: "Music", firstIconName: "speaker.wave.1", secondIconName: "speaker.wave.3")
            
            HStack {
                NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                    CustomButton(buttonAction: {
                        print("home button pressed")
                        self.selectedButton = 1
                    }, imageName: homeSymbol, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .trailing, buttonColor: pauseViewColor, systemImage: true)
                    .frame(width: UIScreen.screenWidth / 2, height: buttonHeigth, alignment: .center)
                    .padding(.trailing, -50)
                }
                
                NavigationLink(destination: ContentView(), tag: 2, selection: $selectedButton) {
                    CustomButton(buttonAction: {
                        print("content view button pressed")
                        self.selectedButton = 2
                    }, imageName: playSymbol, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .leading, buttonColor: pauseViewColor, systemImage: true)
                    .frame(width: UIScreen.screenWidth / 2, height: buttonHeigth, alignment: .center)
                    .padding(.leading, -50)
                }
            }
            .frame(width: UIScreen.screenWidth, height: 100, alignment: .center)
            .padding(.top, 60)
        }
    }
}

struct PauseView: View {
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            Image("pauseView").resizable().frame(width: 350, height: 350, alignment: .center)
                                .overlay(PauseViewContent())
                        }
                    )
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}

