//
//  JobHunterApp.swift
//  JobHunter
//
//  Created by Nikita on 09.10.2024.
//

import SwiftUI

@main
struct JobHunterApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.currentView
                .onAppear {
                    coordinator.showLoginView()
                }
        }
    }
}
