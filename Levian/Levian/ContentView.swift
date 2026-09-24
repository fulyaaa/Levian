//
//  ContentView.swift
//  Levian
//
//  Created by fulya akan on 21.09.2026.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var starterName: String = ""
    @State private var starterWeight: String = ""
    @State private var storageType: String = "Counter"
    
    var body: some View {
        ZStack {
            Color("primaryBackground")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Meet Levian")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                
                Text("Your sourdough starter companion")
                    .font(.subheadline)
                    .foregroundColor(Color("primaryText").opacity(0.7))
                
                TextField("Starter Name", text: $starterName)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                    .padding(.bottom, 8)
                
                TextField("Starter Weight (g)", text: $starterWeight)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                    .keyboardType(.numberPad)
                
                Picker("Storage", selection: $storageType) {
                    Text("Counter").tag("Counter")
                    Text("Fridge").tag("Fridge")
                }
                .pickerStyle(.segmented)
                Button(action: {
                    // continue action
                }) {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("primaryText"))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(Color("accent"))
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView()
}
