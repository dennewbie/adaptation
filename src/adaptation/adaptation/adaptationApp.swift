//
//  adaptationApp.swift
//  adaptation
//
//  Created by Denny Caruso on 11/04/22.
//

import SwiftUI

@main
struct adaptationApp: App {
    @State private var showModal = false
    @State private var modalData = ModalData.empty
    
    var body: some Scene {
        WindowGroup {
            HomeView().onReceive(NotificationCenter.default.publisher(for: .showModal)) { notif in
                if let data = notif.object as? ModalData {
                  modalData = data
                  showModal = true
                }
              }
              .fullScreenCover(isPresented: $showModal, onDismiss: modalData.onDismiss) {
                  modalData.content($showModal)
              }
        }
    }
}
