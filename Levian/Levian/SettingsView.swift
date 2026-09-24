//
//  SettingsView.swift
//  Levian
//
//  Created by fulya akan on 24.09.2026.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var starterName: String = ""
    @State private var starterWeight: String = ""
    @State private var storageType: String = "Counter"
    @State private var reminderInterval: String = "24"
    
    var body: some View {
        ZStack {
          Color("primaryBackground")
                .ignoresSafeArea()
            VStack(spacing: 20){
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
                
                TextField("Reminder every (hours)", text: $reminderInterval)
                    .padding()
                    .background(Color("accent").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(Color("primaryText"))
                    .keyboardType(.numberPad)
                
                Button(action: {
                    // save action
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
}
