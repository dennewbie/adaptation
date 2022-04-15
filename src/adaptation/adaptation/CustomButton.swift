//
//  CustomButton.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct CustomButton: View {
    var buttonAction: () -> Void
    let imageName: String
    let buttonHeight: CGFloat
    let buttonWidth: CGFloat
    let buttonAlignment: Alignment
    let buttonColor: UIColor
    let systemImage: Bool
    @State var audioPlayer: AVAudioPlayer?
    
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
        guard let path = Bundle.main.path(forResource: "buttonSound", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
