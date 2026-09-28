//
//  StarterViewModel.swift
//  Levian
//
//  Created by fulya akan on 28.09.2026.
//
import Foundation
import Combine

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
    
    init() {
        self.starterName = UserDefaults.standard.string(forKey: "starterName") ?? ""
        self.starterWeight = UserDefaults.standard.string(forKey: "starterWeight") ?? ""
        self.storageType = UserDefaults.standard.string(forKey: "storageType") ?? ""
        self.lastFedDate = UserDefaults.standard.object(forKey: "lastFedDate") as? Date
        self.startDate = UserDefaults.standard.object(forKey: "startDate") as? Date ?? Date()
    }

    
    
}
