//
//  HomeView.swift
//  adaptation
//
//  Created by Denny Caruso on 13/04/22.
//

import SwiftUI

struct HomeView: View {
    let homeViewColorPlayButton: UIColor = UIColor( red: 132 / 255, green: 93 / 255, blue: 250 / 255, alpha: 1.0)
    let homeViewColorSettingsButton: UIColor = UIColor( red: 37 / 255, green: 17 / 255, blue: 97 / 255, alpha: 1.0)
    @State private var selectedButton: Int? = nil
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    NavigationLink(destination: SettingsView(), tag: 1, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("settings button pressed")
                            self.selectedButton = 1
                        }, imageName: "gearshape.fill", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .trailing, buttonColor: homeViewColorSettingsButton, systemImage: true)
                        .padding(.leading, UIScreen.screenWidth / 1.5)
                        .padding(.top, 60)
                    }
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .top)
                    
                VStack {
                    Image("maleCharacter").resizable().frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenHeight / 3.7, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Text("Adaptation")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .center)
                
                VStack {
                    NavigationLink(destination: ContentView(), tag: 2, selection: $selectedButton) {
                        CustomButton(buttonAction: {
                            print("play button pressed")
                            self.selectedButton = 2
                        }, imageName: "play.circle", buttonHeight: 100, buttonWidth: 100, buttonAlignment: .bottom, buttonColor: homeViewColorPlayButton, systemImage: true)
                        .padding(.bottom, 100)
                    }
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3, alignment: .bottom)
                }
            }
        }
        .navigationBarTitle("Title")
        .navigationBarHidden(true)
    }
}
//
//extension View {
//    /// Navigate to a new view.
//    /// - Parameters:
//    ///   - view: View to navigate to.
//    ///   - binding: Only navigates when this condition is `true`.
//    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
//        NavigationView {
//            ZStack {
//                self
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
//
//                NavigationLink(
//                    destination: view
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true),
//                    isActive: binding
//                ) {
//                    EmptyView()
//                }
//            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
