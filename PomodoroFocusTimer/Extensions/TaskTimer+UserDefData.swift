//
//  TaskTimer+UserDefData.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension TaskTimer {
    func getCurrentIntervalType() -> Bool {
        if let currentIntervalType = UserDefaults.standard.value(forKey: "isWorkIntervalType") {
            return currentIntervalType as! Bool
        } else {
            return true }
    }
    
    func getSettingsDataInt(for key: String) -> Int {
        if let interval = UserDefaults.standard.value(forKey: key) {
            return interval as! Int
        } else {
            return 0
        }
    }
    
    func getSettingsDataString(for key: String) -> String {
        if let interval = UserDefaults.standard.value(forKey: key) {
            return interval as! String
        } else {
            return ""
        }
    }
}
