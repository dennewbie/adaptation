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
            HStack{
                CustomButton(buttonAction: {self.presentationMode.wrappedValue.dismiss()}, imageName: "arrowshape.turn.up.backward.circle", buttonHeight: 51, buttonWidth: 51, buttonAlignment: .leading, buttonColor:UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0),systemImage: true)
                    .padding(.trailing,UIScreen.screenWidth/3.7)
                    .frame(width: 51, height: 51)
    
                Text("Levels")
                    .foregroundColor(Color(red: 37/255, green: 17/255, blue: 97/255 ))
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .padding(.trailing,66)
                
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/10, alignment: .center)
                
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
                .padding(8)
                
            Text(livello)
                .foregroundColor(.white)
                .font(.system(size: 35))
                .fontWeight(.bold)
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
