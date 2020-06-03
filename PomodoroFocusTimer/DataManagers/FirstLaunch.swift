//
//  FirstLaunch.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation
import CoreData

var firstLaunch: Bool!

public func detectFirstLaunch() {
    
    let launchedBefore = UserDefaults.standard.bool(forKey: "firstLaunch")
    if launchedBefore {
        firstLaunch = false
    } else {
        setValueForFirstLaunch()
        
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        firstLaunch = true
    }
}

func setValueForFirstLaunch() {
    
    // Создаем Default task
    guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        else { return }
    
    let taskObject = Task(entity: entity, insertInto: context)
    
    taskObject.title = "Default task"
    taskObject.counter = 0
    do {
        try context.save()
    } catch let error as NSError {
        print (error.localizedDescription)
    }
    
    // Создаем первоначальные ключи и настройки
    // Не оптимальное решение - реализовать на enum
    //UserDefaults.standard.set("work", forKey: "currentIntervalType")
    UserDefaults.standard.set(true, forKey: "isWorkIntervalType")
    UserDefaults.standard.set(25, forKey: "workInterval")
    UserDefaults.standard.set(5, forKey: "breakInterval")
    UserDefaults.standard.set("Default task", forKey: "lastTask")
    UserDefaults.standard.set("yellow", forKey: "colorScheme")
}
