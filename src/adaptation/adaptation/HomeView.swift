//
//  HomeView.swift
//  adaptation
//
//  Created by Giuseppe Cuccurullo on 12/04/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: LevelView(), label: {Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)})
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
