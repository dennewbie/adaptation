//
//  BackButtonView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 13/04/22.
//

import SwiftUI

struct BackButtonView: View {
    @State var shown: Bool=false
    
    var body: some View {
        ZStack {
            CustomButton(buttonAction: {
                print("View")
            }, imageName: "arrowshape.turn.up.backward.circle", buttonHeight: 51, buttonWidth: 51, buttonAlignment: .leading, buttonColor: UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0), systemImage: true).padding(.trailing, UIScreen.screenWidth / 3.7).frame(width: 51, height: 51)
            if(shown){
                WinContentView()
            }
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}
