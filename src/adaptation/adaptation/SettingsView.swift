//
//  SettingsView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct SettingsView: View {
    let settingsViewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let confirmSymbol: String = String("confirmButton")
    let buttonWidth: CGFloat = 60
    let buttonHeigth: CGFloat = 60
    @State private var selectedButton: Int? = nil
    
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
                            Image("pauseView").resizable().frame(width: 350, height: 400, alignment: .center)
                                .overlay(
                                    VStack {
                                        TitleMenuView(titleLabelText: "Settings")
                                        SliderView(sliderOptionLabelText: "Sound", firstIconName: "speaker.wave.1", secondIconName: "speaker.wave.3")
                                        SliderView(sliderOptionLabelText: "Music", firstIconName: "music.note", secondIconName: "music.quarternote.3")
                                        
                                        NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                                            CustomButton(buttonAction: {
                                                print("confirm button pressed")
                                                self.selectedButton = 1
                                            }, imageName: confirmSymbol, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .center, buttonColor: settingsViewColor, systemImage: false)
                                            .padding(.top, 25)
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

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
