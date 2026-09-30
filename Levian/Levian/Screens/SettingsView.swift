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
    
    var body: some View {
        ZStack {
          Color("primaryBackground")
                .ignoresSafeArea()
            VStack(spacing: 20){
                TextField("Starter Name", text: $viewModel.starterName)
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
                
                TextField("Reminder every (hours)", text: $viewModel.reminderInterval)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                    .keyboardType(.numberPad)
                
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
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(StarterViewModel())
}
