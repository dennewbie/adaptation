//
//  LevelsView.swift
//  adaptation
//
//  Created by Alfredo Mungari on 13/04/22.
//

import SwiftUI

struct LevelsView: View {
    @State var selectedButton: Int? = nil
    let availableLevelColor: UIColor = UIColor(red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let notAvailableLevelColor: UIColor = UIColor(red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    var availableLevels: [Bool] = []
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
        availableLevels = UserDefaults.standard.array(forKey: "availableLevels")  as? [Bool] ?? [Bool]()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        NavigationLink(destination: HomeView(), tag: 0, selection: $selectedButton) {
                            CustomButton(buttonAction: {
                                print("Back Button clicked")
                                self.selectedButton = 0
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
                        NavigationLink(destination: ContentView(), tag: 1, selection: $selectedButton) {
                            SingleLevelsView(levelID: "1", isLevelAvailable: availableLevels[0], levelTag: self.$selectedButton, levelToAccess: 1)
                        }
                        .disabled(!availableLevels[0])
                        
                        NavigationLink(destination: ContentView(), tag: 2, selection: $selectedButton) {
                            SingleLevelsView(levelID: "2", isLevelAvailable: availableLevels[1], levelTag: self.$selectedButton, levelToAccess: 2)
                        }
                        .disabled(!availableLevels[1])
                    }
                    
                    HStack {
                        NavigationLink(destination: ContentView(), tag: 3, selection: $selectedButton) {
                            SingleLevelsView(levelID: "3", isLevelAvailable: availableLevels[2], levelTag: self.$selectedButton, levelToAccess: 3)
                        }
                        .disabled(!availableLevels[2])
                        
                        NavigationLink(destination: ContentView(), tag: 4, selection: $selectedButton) {
                            SingleLevelsView(levelID: "4", isLevelAvailable: availableLevels[3], levelTag: self.$selectedButton, levelToAccess: 4)
                        }
                        .disabled(!availableLevels[3])
                    }
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 1.5, alignment: .top)
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}
