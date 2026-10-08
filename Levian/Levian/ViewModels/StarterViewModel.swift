//
//  StarterViewModel.swift
//  Levian
//
//  Created by fulya akan on 28.09.2026.
//
import Foundation
import Combine
import UserNotifications

class StarterViewModel: ObservableObject {
    
    @Published var starterName: String = "" {
        didSet{
            UserDefaults.standard.set(starterName, forKey: "starterName")
        }
    }
 
    @Published var starterWeight: String = "" {
        didSet{
            UserDefaults.standard.set(starterWeight, forKey: "starterWeight")
        }
    }
    
    @Published var storageType: String = "" {
        didSet{
            UserDefaults.standard.set(storageType, forKey: "storageType")
        }
    }
    
    @Published var lastFedDate: Date? {
        didSet {
            if let date = lastFedDate {
                UserDefaults.standard.set(date, forKey: "lastFedDate")
            }
        }
    }
    
    @Published var startDate: Date {
        didSet {
            UserDefaults.standard.set(startDate, forKey: "startDate")
        }
    }
    
    @Published var reminderInterval: String = "168" {
        didSet {
            UserDefaults.standard.set(reminderInterval, forKey: "reminderInterval")
        }
    }
    
    @Published var feedingHistory: [Date] = [] {
        didSet {
            let timestamps = feedingHistory.map { $0.timeIntervalSince1970 }
            UserDefaults.standard.set(timestamps, forKey: "feedingHistory")
        }
    }
    
    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Time to feed \(starterName.isEmpty ? "Levian" : starterName)! 🍞"
        content.sound = .default
        
        let hours = Double(reminderInterval) ?? 168
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600*hours, repeats: true)

        let request = UNNotificationRequest(identifier: "feedReminder", content: content, trigger: trigger)
        center.add(request)
    }
    
    var lastFedText: String {
        guard let date = lastFedDate else { return "not fed yet" }
        let interval = Date().timeIntervalSince(date)
        let hours = Int(interval / 3600)
        let minutes = Int(interval / 60) % 60
        if hours == 0 { return "\(minutes) min ago" }
        if hours < 24 { return "\(hours)h ago" }
        return "\(hours / 24)d ago"
    }
    
    func logFeeding() {
        let now = Date()
        lastFedDate = now
        feedingHistory.insert(now, at: 0)
        scheduleNotification()
    }
    
    init() {
        self.starterName = UserDefaults.standard.string(forKey: "starterName") ?? ""
        self.starterWeight = UserDefaults.standard.string(forKey: "starterWeight") ?? ""
        self.storageType = UserDefaults.standard.string(forKey: "storageType") ?? ""
        self.lastFedDate = UserDefaults.standard.object(forKey: "lastFedDate") as? Date
        self.startDate = UserDefaults.standard.object(forKey: "startDate") as? Date ?? Date()
        self.reminderInterval = UserDefaults.standard.string(forKey: "reminderInterval") ?? "168"
        
        if let timestamps = UserDefaults.standard.array(forKey: "feedingHistory") as? [Double] {
            self.feedingHistory = timestamps.map { Date(timeIntervalSince1970: $0)
            }
        }
    }

    
    
}
