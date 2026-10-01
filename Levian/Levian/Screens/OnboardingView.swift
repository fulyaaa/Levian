//
//  ContentView.swift
//  Levian
//
//  Created by fulya akan on 21.09.2026.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var viewModel: StarterViewModel
    
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        ZStack {
            Color("primaryBackground")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Meet Levian")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                ZStack {
                    LottieView(fileName: "blob")
                        .frame(width: 200, height: 200)
                    
                    HStack(spacing: 30) {
                        Circle()
                            .fill(Color("primaryText"))
                            .frame(width: 18, height: 18)
                        Circle()
                            .fill(Color("primaryText"))
                            .frame(width: 18, height: 18)
                    }
                    .offset(y: -20)
                    
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addQuadCurve(
                            to: CGPoint(x: 40, y: 0),
                            control: CGPoint(x: 20, y: 12)
                        )
                    }
                    .stroke(Color("primaryText"), lineWidth: 4)
                    .frame(width: 40, height: 12)
                    .offset(y: 15)
                }
                
                Text("Your sourdough starter companion")
                    .font(.subheadline)
                    .foregroundColor(Color("primaryText").opacity(0.7))
                
                TextField("Starter name or use Levian", text: $viewModel.starterName)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                    .padding(.bottom, 8)
                
                TextField("Starter Weight (g)", text: $viewModel.starterWeight)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                    .keyboardType(.numberPad)
                
                Picker("Storage", selection: $viewModel.storageType) {
                    Text("Counter").tag("Counter")
                    Text("Fridge").tag("Fridge")
                }
                .pickerStyle(.segmented)
                Button(action: {
                    viewModel.startDate = Date()
                    isOnboardingComplete = true
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
        .environmentObject(StarterViewModel())
}
