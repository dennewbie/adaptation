//
//  LevelsView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 13/04/22.
//

import SwiftUI

struct LevelsView: View {
    var body: some View {
        VStack {
            HStack {
                BackButtonView()
    
                Text("Levels").foregroundColor(Color(red: 37/255, green: 17/255, blue: 97/255)).fontWeight(.bold).font(.system(size: 40)).padding(.trailing, 66)
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 10, alignment: .center)
            
            HStack {
                SingleLevelsView(level: "1")
                SingleLevelsView(level: "2")
            }
            
            HStack {
                SingleLevelsView(level: "3")
                SingleLevelsView(level: "4")
            }
            
            Spacer()
        }
    }
}
