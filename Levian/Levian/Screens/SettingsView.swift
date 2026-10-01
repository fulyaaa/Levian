//
//  SettingsView.swift
//  Levian
//
//  Created by fulya akan on 24.09.2026.
//
import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: StarterViewModel
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        ZStack {
            Color("primaryBackground")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                    .padding(.top, 20)
                
                TextField("Starter Name", text: $viewModel.starterName)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                
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
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Feeding Reminder")
                        .font(.caption)
                        .foregroundColor(Color("primaryText").opacity(0.6))
                    
                    Picker("Reminder", selection: $viewModel.reminderInterval) {
                        Text("12h").tag("12")
                        Text("24h").tag("24")
                        Text("48h").tag("48")
                        Text("Every week").tag("168")
                    }
                    .pickerStyle(.segmented)
                }
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Save")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("primaryText"))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(Color("accent"))
                        .clipShape(Capsule())
                }
                
                Divider()
                    .background(Color("primaryText").opacity(0.3))
                    .padding(.vertical, 8)
                
                Button(action: {
                    isOnboardingComplete = false
                    dismiss()
                }) {
                    Text("Reset & Start Over")
                        .fontWeight(.semibold)
                        .foregroundColor(.red.opacity(0.8))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(Color.red.opacity(0.1))
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
    }
}
