//
//  InfoView.swift
//  adaptation
//
//  Created by Denny Caruso on 14/04/22.
//

import SwiftUI

struct InfoView: View {
    let alertTitle: String = "Credits"
    let alertHeigth: CGFloat = 300
    let alertWidth: CGFloat = 350
    let firstButtonSymbol: String = String("confirmButton")
    var body: some View {
        CustomAlert(alertTitle: alertTitle, alertHeigth: alertHeigth, alertWidth: alertWidth, firstButtonSymbol: firstButtonSymbol, secondButtonSymbol: nil, alertType: 3)
    }
}
