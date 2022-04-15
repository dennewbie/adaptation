//
//  LevelsView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 13/04/22.
//

import SwiftUI

struct LevelsView: View {
    @State private var selectedButton: Int? = nil
    let availableLevelColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let notAvailableLevelColor: UIColor = UIColor(red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        NavigationLink(destination: HomeView(), tag: 1, selection: $selectedButton) {
                            CustomButton(buttonAction: {
                                print("Back Button clicked")
                                self.selectedButton = 1
                            }, imageName: "arrowshape.turn.up.backward.circle", buttonHeight: 65, buttonWidth: 65, buttonAlignment: .topLeading, buttonColor: availableLevelColor, systemImage: true)
                        }
                    }

                    VStack {
                        Text("Levels")
                            .foregroundColor(Color(red: 37/255, green: 17/255, blue: 97/255))
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                    }
                }
                .padding(.top, 0)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 5, alignment: .topLeading)
                
                VStack {
                    HStack {
                        SingleLevelsView(levelID: "1", isLevelAvailable: true)
                        SingleLevelsView(levelID: "2", isLevelAvailable: false)
                    }
                    
                    HStack {
                        SingleLevelsView(levelID: "3", isLevelAvailable: false)
                        SingleLevelsView(levelID: "4", isLevelAvailable: false)
                    }
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 1.5, alignment: .top)
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}
