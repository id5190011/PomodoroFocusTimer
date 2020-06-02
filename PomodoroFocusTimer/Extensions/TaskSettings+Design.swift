//
//  TaskSettings+Design.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 02.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension TaskSettings {
    
    func setUpSettingsUI() {
        tableView.backgroundColor = CustomColor.darkGray
        
        workIntervalLabel.textColor = CustomColor.lightGray
        
        workIntervalTextField.backgroundColor = CustomColor.darkGray
        workIntervalTextField.textColor = CustomColor.lightGray
        
        breakIntervalLabel.textColor = CustomColor.lightGray
        
        breakIntervalTextField.backgroundColor = CustomColor.darkGray
        breakIntervalTextField.textColor = CustomColor.lightGray
        
        redSchemeButton.backgroundColor = CustomColor.red
        redSchemeButton.tintColor = CustomColor.darkGray
        redSchemeButton.layer.cornerRadius = 4
        redSchemeButton.setTitle("", for: .normal)
        
        yellowSchemeButton.backgroundColor = CustomColor.yellow
        yellowSchemeButton.tintColor = CustomColor.darkGray
        yellowSchemeButton.layer.cornerRadius = 4
        yellowSchemeButton.setTitle("", for: .normal)

        greenSchemeButton.backgroundColor = CustomColor.green
        greenSchemeButton.tintColor = CustomColor.darkGray
        greenSchemeButton.layer.cornerRadius = 4
        greenSchemeButton.setTitle("", for: .normal)

        blueSchemeButton.backgroundColor = CustomColor.blue
        blueSchemeButton.tintColor = CustomColor.darkGray
        blueSchemeButton.layer.cornerRadius = 4
        blueSchemeButton.setTitle("", for: .normal)
        
        workIntervalTextField.layer.borderWidth = 1
        workIntervalTextField.layer.borderColor = CustomColor.lightGray.cgColor
        workIntervalTextField.layer.cornerRadius = 6
        
        breakIntervalTextField.layer.borderWidth = 1
        breakIntervalTextField.layer.borderColor = CustomColor.lightGray.cgColor
        breakIntervalTextField.layer.cornerRadius = 6
}
    
    func applyChangesAndShowAlert(color: String) {
        UserDefaults.standard.set(color, forKey: "colorScheme")
        alert(title: "Message", message: "To apply color settings, reload the application!")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
