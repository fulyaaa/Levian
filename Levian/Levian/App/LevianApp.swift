//
//  LevianApp.swift
//  Levian
//
//  Created by fulya akan on 21.09.2026.
//

import SwiftUI
import UserNotifications

@main
struct LevianApp: App {
    
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    @StateObject private var viewModel = StarterViewModel()
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingComplete {
                MainView()
                    .environmentObject(viewModel)
            } else {
                OnboardingView()
                    .environmentObject(viewModel)
            }
        }
        
    }
}
