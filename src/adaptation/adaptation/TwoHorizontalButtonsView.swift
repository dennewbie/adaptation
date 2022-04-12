//
//  TwoHorizontalButtonsView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct TwoHorizontalButtonsView: View {
    let viewColor: UIColor
    let firstButtonSymbol: String
    let secondButtonSymbol: String
    let buttonsWidth: CGFloat
    let buttonsHeigth: CGFloat
    let padding: CGFloat
    var firstButtonAction: () -> Void
    var secondButtonAction: () -> Void
    
    var body: some View {
        HStack {
            CustomButton(buttonAction: {
                firstButtonAction()
            }, imageName: firstButtonSymbol, buttonHeight: buttonsHeigth, buttonWidth: buttonsWidth, buttonAlignment: .trailing, buttonColor: viewColor)
            
            CustomButton(buttonAction: {
                secondButtonAction()
            }, imageName: secondButtonSymbol, buttonHeight: buttonsHeigth, buttonWidth: buttonsWidth, buttonAlignment: .leading, buttonColor: viewColor)
        }
        .padding(.all, padding)
    }
}
