//
//  SingleLevelView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 13/04/22.
//

import SwiftUI

struct SingleLevelsView: View {
    let level : String
    let colorDark : Color = Color(red: 37 / 255, green: 17 / 255, blue: 97 / 255)
    let colorLight : Color = Color(red: 132 / 255, green: 93 / 255, blue: 250 / 255)
    var levelcomplete : Bool = false
   
    var body: some View {
        if levelcomplete {
            ZStack {
                Rectangle().frame(width: 170, height: 138).foregroundColor(colorLight).cornerRadius(30)
                
                Text(level).foregroundColor(.white)
            }
        } else {
            ZStack{
                Rectangle().frame(width: 170, height: 138).foregroundColor(colorDark).cornerRadius(30).padding(8)
                    
                Text(level).foregroundColor(.white).font(.system(size: 35)).fontWeight(.bold)
            }
        }
    }
}


