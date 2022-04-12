//
//  CustomButton.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct CustomButton: View {
    var buttonAction: () -> Void
    let imageName: String
    let buttonHeight: CGFloat
    let buttonWidth: CGFloat
    let buttonAlignment: Alignment
    let buttonColor: UIColor
    
    var body: some View {
        Button(action: {
            self.buttonAction()
        }, label: {
            Image(systemName: imageName).resizable().frame(width: buttonWidth, height: buttonHeight, alignment: buttonAlignment)
                .padding(.trailing, 40)
                .padding(.leading, 40)
                .foregroundColor(Color(uiColor: buttonColor))
        })
    }
}
