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
            SwitchView(switchName: "Sound")
            
            NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                NavigationLink(destination: ContentView(), tag: 2, selection: $selectedButton) {
                    TwoHorizontalButtonsView(viewColor: pauseViewColor, firstButtonSymbol: homeSymbol, secondButtonSymbol: playSymbol, buttonsWidth: buttonWidth, buttonsHeigth: buttonHeigth, padding: defaultViewBottomPadding, firstButtonAction: {
                        print("homeButotnPressed")
                        self.selectedButton = 1
                    }, secondButtonAction: {
                        print("playButtonPressed")
                        self.selectedButton = 2
                    }, systemImages: true)
                    .padding(.top, 25)
                }
            }
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
                            Image("pauseView").resizable().frame(width: 350, height: 400, alignment: .center)
                                .overlay(PauseViewContent())
                        }
                    )
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}

