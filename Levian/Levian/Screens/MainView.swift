//
//  MainView.swift
//  Levian
//
//  Created by fulya akan on 24.09.2026.
//

import SwiftUI
import UserNotifications

struct MainView: View {
    
    @State private var showSettings: Bool = false
    @EnvironmentObject var viewModel: StarterViewModel
    
    var body: some View {
        ZStack {
            Color("primaryBackground")
                .ignoresSafeArea()
            VStack(spacing: 24){
                Text(viewModel.starterName.isEmpty ? "Levian" : viewModel.starterName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                LottieView(fileName: "blob")
                    .frame(width: 220, height: 220)
                
                Text("Day \(Calendar.current.dateComponents([.day], from: viewModel.startDate, to: Date()).day ?? 1)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                if let date = viewModel.lastFedDate {
                    Text("Last fed: \(date.formatted(.dateTime.hour().minute()))")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("primaryText"))
                } else {
                    Text("Not fed yet")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("primaryText"))
                }
                    
                Button(action: {
                    viewModel.lastFedDate = Date()
                    viewModel.scheduleNotification()
                }) {
                    Text(viewModel.starterName.isEmpty ? "I Fed Levian! 🍞" : "I Fed \(viewModel.starterName)! 🍞")
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
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                print("Notification permission: \(granted)")
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(StarterViewModel())
}
