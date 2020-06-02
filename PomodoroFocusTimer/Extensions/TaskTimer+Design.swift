//
//  TaskTimer+Design.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension TaskTimer {
    
    func setUpTaskTimerUI() {
        
        view.backgroundColor = CustomColor.darkGray
        
        timelabel.textColor = CustomColor.colorScheme
        
        currentTaskTextField.backgroundColor = CustomColor.darkGray
        currentTaskTextField.textColor = CustomColor.colorScheme
        
        if let lastTask = UserDefaults.standard.value(forKey: "lastTask") as? String {
            currentTaskTextField.text = lastTask
        }
        
        startButton.backgroundColor = CustomColor.darkGray
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = CustomColor.lightGray.cgColor
        startButton.tintColor = CustomColor.lightGray
        startButton.layer.cornerRadius = 4
        
        pauseButton.backgroundColor = CustomColor.darkGray
        pauseButton.layer.borderWidth = 2
        pauseButton.layer.borderColor = CustomColor.lightGray.cgColor
        pauseButton.tintColor = CustomColor.lightGray
        pauseButton.layer.cornerRadius = 4
        
        skipButton.backgroundColor = CustomColor.darkGray
        skipButton.layer.borderWidth = 2
        skipButton.layer.borderColor = CustomColor.lightGray.cgColor
        skipButton.tintColor = CustomColor.lightGray
        skipButton.layer.cornerRadius = 4
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

