//
//  TaskList+Desigh.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

extension TaskList {
    func setUpTaskListUI() {
        tableView.rowHeight = 45

        view.backgroundColor = CustomColor.darkGray
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

