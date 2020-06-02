//
//  TaskSettings+TextField.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 03.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension TaskSettings: UITextFieldDelegate {
    
    func addDoneButton(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        textField.inputAccessoryView = keyboardToolBar
        keyboardToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolBar.items = [flexBarButton, doneButton]
        
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрываем клавиатуру вызванную для любого объекта
    }
    
    func workIntervalEndEditing() {
        if workIntervalTextField.text == "" {
            workIntervalTextField.text = workIntervalValue
        }
        
        if let newValue = Int(workIntervalTextField.text!), newValue > 0 && newValue < 1000 {
            setNewValue(value: newValue, for: "workInterval")
        } else {
            workIntervalTextField.text = workIntervalValue
        }
    }
    
    func breakIntervalEndEditing() {
        if breakIntervalTextField.text == "" {
            breakIntervalTextField.text = breakIntervalValue
        }
        
        if let newValue = Int(breakIntervalTextField.text!), newValue > 0 && newValue < 1000 {
            setNewValue(value: newValue, for: "breakInterval")
        } else {
            breakIntervalTextField.text = breakIntervalValue
        }
    }
    
    func setNewValue(value: Int, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
