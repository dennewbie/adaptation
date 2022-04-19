//
//  PauseView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct PauseView: View {
    let alertTitle: String = "Pause"
    let alertHeigth: CGFloat = 350
    let alertWidth: CGFloat = 350
    let firstButtonSymbol: String = String("house.circle")
    let secondButtonSymbol: String = String("repeat.circle")
    var body: some View {
        CustomAlert(alertTitle: alertTitle, alertHeigth: alertHeigth, alertWidth: alertWidth, firstButtonSymbol: firstButtonSymbol, secondButtonSymbol: secondButtonSymbol, alertType: 1)
    }
}
