//
//  TaskSettings+UserDefData.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 03.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

extension TaskSettings {
    
    func fillIntervalSettings() {
        workIntervalTextField.text = String(getSettingsDataInt(for: "workInterval"))
        breakIntervalTextField.text = String(getSettingsDataInt(for: "breakInterval"))
    }
    
    func getSettingsDataInt(for key: String) -> Int {
        if let interval = UserDefaults.standard.value(forKey: key) {
            return interval as! Int
        } else {
            return 0
        }
        
    }
}
