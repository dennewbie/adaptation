//
//  TitleMenuView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI

struct TitleMenuView: View {
    var titleLabelText: String
    
    var body: some View {
        Text(titleLabelText)
            .fontWeight(.bold)
            .font(.system(size: 30))
            .foregroundColor(Color( red: 132/255, green: 93/255, blue: 250/255))
            .padding(.vertical,10)
    }
}
