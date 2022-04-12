//
//  ContentView.swift
//  Settings
//
//  Created by Carmine on 11/04/22.
//

import SwiftUI
import MediaPlayer

struct SettingsView: View {
    var body: some View {
        Menu(titoloMenu: "Settings",buttonHome: false)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



struct TitoloMenu: View {
    var titolo:String
    var body: some View {
        Text(titolo)
            .fontWeight(.bold)
            .font(.system(size: 30))
            .foregroundColor(Color( red: 132/255, green: 93/255, blue: 250/255))
            .padding(.vertical,20)
    }
}

struct LabelSlider: View {
    @State private var music:Float = 0.5

    var label:String
    var icona1:String="stop"
    var icona2:String="stop"
    var body: some View {
        Text("\(label) :")
            .fontWeight(.bold)
            .font(.system(size: 30))
            .position(x: 90, y: 0)
            .padding()
        HStack {
            Image(systemName:icona1)
                .padding(.vertical, 20.0)
                .padding(.leading, 60.0)
                .font(.system(size: 20))
            Slider(value: $music, in: 0...1,step: 0.0625, onEditingChanged: { data in
                        MPVolumeView.setVolume(self.music)
            })
            .accentColor(Color( red: 132/255, green: 93/255, blue: 250/255))
            
            
            Image(systemName: icona2)
                .padding(.vertical, 20.0)
                .padding(.trailing, 30.0)
                .font(.system(size: 30))
                
        }
    }
}

struct Menu: View {
    var titoloMenu:String
    var buttonHome:Bool=false
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0.3)
                .ignoresSafeArea()
            Image("pauseView")
                .overlay(
                    VStack {
                        TitoloMenu(titolo: titoloMenu)
                        LabelSlider(label: "Music",icona1: "speaker.wave.1",icona2: "speaker.wave.3")
                        LabelSlider(label: "Sound",icona1: "music.note",icona2: "music.note")
                        HStack {
                            if(buttonHome==true){
                                Button(action : {
                                print("A casa")
                            }){
                                Image(systemName: "house.circle")
                                   .padding(.bottom)
                                   .font(.system(size: 60))
                                   .foregroundColor(Color(red: 132/255, green: 93/255, blue: 250/255))
                                }.padding(.horizontal,30)
                                Button(action : {
                                    print("Riprendi")
                                }){
                                    Image(systemName:"play.circle")
                                       .padding(.bottom)
                                       .font(.system(size: 60))
                                       .foregroundColor(Color(red: 132/255, green: 93/255, blue: 250/255))
                                }.padding(.horizontal,30)
                            }else{
                            Button(action : {
                                print("Riprendi")
                            }){
                                Image("confirmButton").resizable().frame(width: 60, height: 60, alignment: .trailing)
                                   .padding(.bottom)
                                   .foregroundColor(Color(red: 132/255, green: 93/255, blue: 250/255))
                            }.padding(.horizontal,30)
                            
                        }
                        }
                        
                    }
                        
                        
            )
        }
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}


