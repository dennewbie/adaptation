//
//  SingleLevelView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 13/04/22.
//

import SwiftUI

struct SingleLevelsView: View {
    let levelID : String
    let colorDark : UIColor = UIColor(red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    let colorLight : UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    var isLevelAvailable : Bool
    @Binding var levelTag: Int?
    var levelToAccess: Int
    
    var body: some View {
        if (isLevelAvailable) {
            ZStack {
                CustomButton(buttonAction: {
                    print("av level")
                    self.levelTag = levelToAccess
                    GameSingleton.shared.setCurrentLevel(newCurrentLevel: levelToAccess)
                }, imageName: "availableLevel", buttonHeight: UIScreen.screenHeight / 6, buttonWidth: UIScreen.screenWidth / 2.5, buttonAlignment: .center, buttonColor: colorLight, systemImage: false)
                .frame(width: UIScreen.screenWidth / 2.2, height: UIScreen.screenHeight / 6)
                Text(levelID)
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .bold, design: .default))
            }
            .padding(.bottom, 20)
        } else {
            ZStack {
                CustomButton(buttonAction: {
                    print("!av level")
                }, imageName: "notAvailableLevel", buttonHeight: UIScreen.screenHeight / 6, buttonWidth: UIScreen.screenWidth / 2.5, buttonAlignment: .center, buttonColor: colorDark, systemImage: false)
                .frame(width: UIScreen.screenWidth / 2.2, height: UIScreen.screenHeight / 6)
                .disabled(true)
                Text(levelID)
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .bold, design: .default))
            }
            .padding(.bottom, 20)
        }
    }
}
