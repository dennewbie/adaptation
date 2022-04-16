//
//  SwitchView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 14/04/22.
//

import SwiftUI

struct SwitchView: View {
    let color: Color = Color(UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0))
    var switchName: String
    
    @State private var isSoundActive = true
    
    var body: some View {
        Toggle(switchName, isOn: $isSoundActive)
            .font(.system(size: 20).bold())
            .toggleStyle(.switch)
            .tint(color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 40)
            .onChange(of: isSoundActive) {
                value in
                UserDefaults.standard.set(false, forKey: "isSoundActive")
            }
            .onAppear(perform: {
                isSoundActive = UserDefaults.standard.bool(forKey: "isSoundActive")
                print("Suono: \(isSoundActive)")
            })
    }
}

