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
                ZStack {
                    LottieView(fileName: "blob")
                        .frame(width: 220, height: 220)
                    
    
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
                
                Text("Day \((Calendar.current.dateComponents([.day], from: viewModel.startDate, to: Date()).day ?? 0) + 1)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryText"))
                if viewModel.lastFedDate != nil {
                    Text("Last fed: \(viewModel.lastFedText)")
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
                    viewModel.logFeeding()
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
            
            if !viewModel.feedingHistory.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Feeding History")
                        .font(.caption)
                        .foregroundColor(Color("primaryText").opacity(0.6))
                    
                    ForEach(viewModel.feedingHistory.prefix(5), id: \.self) { date in
                        HStack {
                            Text("🍞")
                            Text(date.formatted(.dateTime.month().day().hour().minute()))
                                .font(.caption)
                                .foregroundColor(Color("primaryText"))
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color("accent").opacity(0.15))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
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
