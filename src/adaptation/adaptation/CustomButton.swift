//
//  CustomButton.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI
import AVFoundation

struct CustomButton: View {
    var buttonAction: () -> Void
    let imageName: String
    let buttonHeight: CGFloat
    let buttonWidth: CGFloat
    let buttonAlignment: Alignment
    let buttonColor: UIColor
    let systemImage: Bool
    
    var body: some View {
        Button(action: {
            playSound()
            self.buttonAction()
        }, label: {
            if (!systemImage) {
                Image(imageName).resizable().frame(width: buttonWidth, height: buttonHeight, alignment: buttonAlignment)
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                    .foregroundColor(Color(uiColor: buttonColor))
            } else {
                Image(systemName: imageName).resizable().frame(width: buttonWidth, height: buttonHeight, alignment: buttonAlignment)
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                    .foregroundColor(Color(uiColor: buttonColor))
            }
        })
    }
    
    func playSound() {
        var filePath: String?
        filePath = Bundle.main.path(forResource: "buttonSound", ofType: "wav")// For you should be siren and mp3
        let fileURL = URL(fileURLWithPath: filePath!)
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
}
