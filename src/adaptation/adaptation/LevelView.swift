//
//  LevelView.swift
//  adaptation
//
//  Created by Giuseppe Cuccurullo on 11/04/22.
//

import SwiftUI

struct LevelView: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var body: some View {
        VStack {
                Text("Levels")
                    .foregroundColor(Color(red: 37/255, green: 17/255, blue: 97/255 ))
                    .font(.largeTitle)
                HStack {
                    LivelliView(livello: "1")
                    LivelliView(livello: "2")
                }
                HStack {
                    LivelliView(livello: "3")
                    LivelliView(livello: "4")
                }
        }.position(x: 195, y: 190)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading, content: {
                    CustomButton(buttonAction: {self.presentationMode.wrappedValue.dismiss()}, imageName: "arrowshape.turn.up.backward.circle", buttonHeight: 41, buttonWidth: 41, buttonAlignment: .bottom, buttonColor:UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0),systemImage: true)
                })
            }
            }
    }

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()

    }
}

struct LivelliView: View {
    let livello : String
    let ColorDark : Color = Color(red: 37/255, green: 17/255, blue: 97/255 )
    let ColorLight : Color = Color(red: 132/255, green: 93/255, blue: 250/255 )
    var levelcomplete : Bool = false
   
    var body: some View {
        if levelcomplete == false {
        ZStack{
            Rectangle()
                .frame(width: 170, height: 138)
                .foregroundColor(ColorDark)
                .cornerRadius(30)
                
            Text(livello)
                .foregroundColor(.white)
            
        }
        }else {
            ZStack{
                Rectangle()
                    .frame(width: 170, height: 138)
                    .foregroundColor(ColorLight)
                    .cornerRadius(30)
                    
                Text(livello)
                    .foregroundColor(.white)
                
                }
            }
        }
    }
