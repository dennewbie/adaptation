//
//  PauseView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct PauseView: View {
    let pauseViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeSymbol: String = String("house.circle")
    let playSymbol: String = String("play.circle")
    let buttonWidth: CGFloat = 60
    let buttonHeigth: CGFloat = 60
    let defaultViewBottomPadding: CGFloat = 0
    @State private var selectedButton: Int? = nil
    
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
                            .overlay(
                                VStack {
                                    TitleMenuView(titleLabelText: "Pause")
                                    SliderView(sliderOptionLabelText: "Sound", firstIconName: "speaker.wave.1", secondIconName: "speaker.wave.3")
                                    SliderView(sliderOptionLabelText: "Music", firstIconName: "music.note", secondIconName: "music.quarternote.3")
                                    
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
                            )
                    }
                )
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}

