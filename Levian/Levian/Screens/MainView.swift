//
//  MainView.swift
//  Levian
//
//  Created by fulya akan on 24.09.2026.
//

import SwiftUI

struct MainView: View {
    
    @State private var showSettings: Bool = false
    
    var body: some View {
        ZStack {
            Color("primaryBackground")
                .ignoresSafeArea()
            VStack(spacing: 24){
                Text("Levian")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                Text("Day 1")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                Text("Last fed: Today at 12:00")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                Button(action: {
                    // fedding action
                }) {
                    Text("I Fed Levian! 🍞")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("primaryText"))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .background(Color("accent"))
                        .clipShape(Capsule())
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("primaryText"))
                            .font(.title2)
                    }
                    .padding()
                }
                Spacer()
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
}

#Preview {
    MainView()
}
