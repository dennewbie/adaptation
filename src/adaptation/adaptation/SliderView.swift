//
//  SingleSliderOptionView.swift
//  adaptation
//
//  Created by Denny Caruso on 12/04/22.
//

import SwiftUI
import MediaPlayer

struct SliderView: View {
    @State private var music:Float = 0.5
    let sliderOptionLabelText: String
    let firstIconName: String
    let secondIconName: String
    
    var body: some View {
        VStack {
            Text(sliderOptionLabelText)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 40)
            
            HStack {
                GlyphImageView(imageName: firstIconName, leadingPading: 40.0, trailingPadding: 25.0, glyphSize: 20)
                
                Slider(value: $music, in: 0...1,step: 0.0625, onEditingChanged: { data in
                    MPVolumeView.setVolume(self.music)
                })
                .accentColor(Color( red: 132 / 255, green: 93 / 255, blue: 250 / 255))
                
                GlyphImageView(imageName: secondIconName, leadingPading: 25.0, trailingPadding: 40.0, glyphSize: 20)
            }
        }
    }
}

struct GlyphImageView: View {
    let imageName: String
    let leadingPading: CGFloat
    let trailingPadding: CGFloat
    let glyphSize: CGFloat
    
    var body: some View {
        Image(systemName: imageName)
            .padding(.vertical, 10.0)
            .padding(.trailing, trailingPadding)
            .padding(.leading, leadingPading)
            .font(.system(size: glyphSize))
            .foregroundColor(Color(red: 132 / 255, green: 93 / 255, blue: 250 / 255))
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
