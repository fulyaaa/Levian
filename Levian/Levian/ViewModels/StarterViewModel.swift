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
    init() {
        self.starterName = UserDefaults.standard.string(forKey: "starterName") ?? ""
        self.starterWeight = UserDefaults.standard.string(forKey: "starterWeight") ?? ""
        self.storageType = UserDefaults.standard.string(forKey: "storageType") ?? ""
    }

    
    
}
