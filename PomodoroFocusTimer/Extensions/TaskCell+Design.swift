//
//  TaskCell+Design.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

extension TaskCell {
    func setUpTaskCellUI() {
        taskTitle.textColor = CustomColor.lightGray
        taskIntervalCounter.textColor = CustomColor.lightGray
        
        backgroundColor = CustomColor.darkGray
    }
}


