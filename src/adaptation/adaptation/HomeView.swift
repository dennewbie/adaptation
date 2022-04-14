//
//  HomeView.swift
//  adaptation
//
//  Created by Denny Caruso on 13/04/22.
//

import SwiftUI

struct TopBlock: View {
    let homeViewColorPlayButton: UIColor = UIColor( red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeViewColorSettingsButton: UIColor = UIColor( red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    let settingsSymbol: String = "gearshape.fill"
    let infoSymbol: String = "info.circle"
    let buttonWidth: CGFloat = 100
    let buttonHeigth: CGFloat = 100
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack{
            HStack {
                NavigationLink(destination: InfoView(), tag: 3, selection: $selectedButton) {
                    CustomButton(buttonAction: {
                        print("info button pressed")
                        self.selectedButton = 3
                    }, imageName: "info.circle", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .center, buttonColor: homeViewColorSettingsButton, systemImage: true)
                    .padding(.all, UIScreen.screenWidth / 12)
                    }

                NavigationLink(destination: SettingsView(), tag: 1, selection: $selectedButton) {
                    CustomButton(buttonAction: {
                        print("settings button pressed")
                        self.selectedButton = 1
                    }, imageName: "gearshape.fill", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .trailing, buttonColor: homeViewColorSettingsButton, systemImage: true)
                    .padding(.all, UIScreen.screenWidth / 12)
                    }
            }
            .frame(width: UIScreen.screenWidth, height: 100, alignment: .center)
            .padding(.top, 60)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .top)
    }
}

struct CentralBlock: View {
    var body: some View {
        VStack {
            Image("maleCharacter").resizable().frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenHeight / 3.7, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text("Adaptation")
                .font(.system(size: 40, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .center)
    }
}

struct BottomBlock: View {
    let homeViewColorPlayButton: UIColor = UIColor( red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeViewColorSettingsButton: UIColor = UIColor( red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        VStack {
            NavigationLink(destination: LevelsView(), tag: 2, selection: $selectedButton) {
                CustomButton(buttonAction: {
                    print("play button pressed")
                    self.selectedButton = 2
                }, imageName: "play.circle", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .bottom, buttonColor: homeViewColorPlayButton, systemImage: true)
                .padding(.bottom, 100)
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .bottom)
        }
    }
}

struct HomeView: View {
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TopBlock()
                CentralBlock()
                BottomBlock()
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
