//
//  TaskList+Alert.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 02.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension TaskList {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
