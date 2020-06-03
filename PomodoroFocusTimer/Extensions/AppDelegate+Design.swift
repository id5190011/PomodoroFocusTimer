//
//  AppDelegate+Design.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func setUpBarsUI() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = CustomColor.colorScheme
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = CustomColor.colorScheme
    }
}
