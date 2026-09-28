//
//  LevianApp.swift
//  Levian
//
//  Created by fulya akan on 21.09.2026.
//

import SwiftUI

@main
struct LevianApp: App {
    
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingComplete {
                MainView()
            } else {
                OnboardingView()
            }
        }
    }
}
