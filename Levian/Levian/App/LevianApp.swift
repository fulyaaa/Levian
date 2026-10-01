//
//  LevianApp.swift
//  Levian
//
//  Created by fulya akan on 21.09.2026.
//
import SwiftUI

@main
struct LevianApp: App {
    @StateObject var viewModel = StarterViewModel()
    @State private var showSplash = true
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
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
}
