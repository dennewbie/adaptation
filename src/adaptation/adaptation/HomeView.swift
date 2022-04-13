//
//  HomeView.swift
//  adaptation
//
//  Created by Denny Caruso on 13/04/22.
//

import SwiftUI

struct HomeView: View {
    let homeViewColorPlayButton: UIColor = UIColor( red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeViewColorSettingsButton: UIColor = UIColor( red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    var body: some View {
        VStack{
            CustomButton(buttonAction: {
                print("settings button pressed")
            }, imageName: "gearshape.fill", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .trailing, buttonColor: homeViewColorSettingsButton, systemImage: true)
            .padding(.leading, UIScreen.screenWidth / 1.5)
            .padding(.top, UIScreen.screenHeight / 15)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .top)
        
        VStack {
            Image("maleCharacter").resizable().frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenHeight / 3.7, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text("Adaptation")
                .font(.system(size: 40, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .center)
        
        VStack {
            CustomButton(buttonAction: {
                print("play button pressed")
            }, imageName: "play.circle", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .bottom, buttonColor: homeViewColorPlayButton, systemImage: true)
            .padding(.bottom, 50)
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .bottom)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
