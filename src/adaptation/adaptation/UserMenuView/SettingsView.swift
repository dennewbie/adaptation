//
//  SettingsView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct SettingsView: View {
    let alertTitle: String = "Settings"
    let alertHeigth: CGFloat = 350
    let alertWidth: CGFloat = 350
    let firstButtonSymbol: String = "confirmButton"
    var body: some View {
        CustomAlert(alertTitle: alertTitle, alertHeigth: alertHeigth, alertWidth: alertWidth, firstButtonSymbol: firstButtonSymbol, secondButtonSymbol: nil, alertType: 2)
    }
}
