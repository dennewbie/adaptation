//
//  CustomAlert.swift
//  adaptation
//
//  Created by Denny Caruso on 16/04/22.
//

import SwiftUI


struct InternalAlertView: View {
    let alertType: Int
    let alertTitle: String
    let buttonWidth: CGFloat = 60
    let buttonHeigth: CGFloat = 60
    let defaultViewBottomPadding: CGFloat = 0
    let viewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
    let firstButtonSymbol: String?
    let secondButtonSymbol: String?
    
    var body: some View {
        VStack {
            TitleMenuView(titleLabelText: alertTitle)
            SliderView(sliderOptionLabelText: "Music", firstIconName: "speaker.wave.1", secondIconName: "speaker.wave.3")
            
            HStack {
                switch (alertType) {
                case 1:
                    NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("home button pressed")
                            self.selectedButton = 1
                        }, imageName: firstButtonSymbol!, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .trailing, buttonColor: viewColor, systemImage: true)
                        .padding(.top, 25)
                    }
                    
                    NavigationLink(destination: ContentView(), tag: 2, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("content view button pressed")
                            self.selectedButton = 2
                        }, imageName: secondButtonSymbol!, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .leading, buttonColor: viewColor, systemImage: true)
                        .padding(.top, 25)
                    }
                    
                case 2:
                    NavigationLink(destination: HomeView(), tag: 3, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("confirm button pressed")
                            self.selectedButton = 3
                        }, imageName: firstButtonSymbol!, buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .center, buttonColor: viewColor, systemImage: false)
                        .padding(.top, 25)
                    }
                default:
                    CustomButton(buttonAction: {
                        print("Errror loading Alert")
                    }, imageName: "", buttonHeight: buttonHeigth, buttonWidth: buttonWidth, buttonAlignment: .center, buttonColor: viewColor, systemImage: false)
                }
            }
        }
    }
}

struct CustomAlert: View {
    let viewColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let firstButtonSymbol: String?
    let secondButtonSymbol: String?
    let alertHeigth: CGFloat
    let alertWidth: CGFloat
    let alertTitle: String
    let alertType: Int
    
    init(alertTitle: String, alertHeigth: CGFloat, alertWidth: CGFloat, firstButtonSymbol: String?, secondButtonSymbol: String?, alertType: Int) {
        UINavigationBar.setAnimationsEnabled(false)
        self.alertTitle = alertTitle
        self.alertWidth = alertWidth
        self.alertHeigth = alertHeigth
        self.firstButtonSymbol = firstButtonSymbol
        self.secondButtonSymbol = secondButtonSymbol
        self.alertType = alertType
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            Image("pauseView").resizable().frame(width: alertWidth, height: alertHeigth, alignment: .center)
                                .overlay(InternalAlertView(alertType: alertType, alertTitle: alertTitle, firstButtonSymbol: firstButtonSymbol, secondButtonSymbol: secondButtonSymbol))
                        }
                    )
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}

