//
//  CustomColors.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

struct CustomColor {
    
    // Установка цветовой схемы
    static var colorScheme = CustomColor.blue
    
    
    static let red = UIColor(red: 237/255, green: 124/255, blue: 90/255, alpha: 1)
    static let yellow = UIColor(red: 255/255, green: 202/255, blue: 42/255, alpha: 1)
    static let green = UIColor(red: 113/255, green: 208/255, blue: 168/255, alpha: 1)
    static let blue = UIColor(red: 68/255, green: 141/255, blue: 247/255, alpha: 1)
    
    static let darkGray = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
    static let middleGray = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    static let lightGray = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
    
    
    static func getRedScheme() {
        CustomColor.colorScheme = CustomColor.red
    }
    
    static func getYellowScheme() {
        CustomColor.colorScheme = CustomColor.yellow
    }
    
    static func getGreenScheme() {
        CustomColor.colorScheme = CustomColor.green
    }
    
    static func getBlueScheme() {
        CustomColor.colorScheme = CustomColor.blue
    }
    
    static func getSettingsDataColor(for key: String) -> UIColor {
        if let color = UserDefaults.standard.value(forKey: key) {
            
            let extractedColor = color as! String
            
            switch extractedColor {
            case "yellow": return CustomColor.yellow
            case "red": return CustomColor.red
            case "green": return CustomColor.green
            case "blue": return CustomColor.blue
            default:
                return CustomColor.yellow
            }
            
        } else {
            return CustomColor.yellow
        }
    }
}


