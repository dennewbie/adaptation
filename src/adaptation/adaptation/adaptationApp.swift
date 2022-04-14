//
//  adaptationApp.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI

@main
struct adaptationApp: App {
    init() {
        UserDefaults.standard.set(false, forKey: "didLaunchBefore")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
