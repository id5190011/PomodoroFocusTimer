//
//  TaskArray.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation
import CoreData

func createTaskArray() -> [String] {
    var tasks: [Task] = []
    var taskArray: [String] = []
    
    let fetchReques: NSFetchRequest<Task> = Task.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
    fetchReques.sortDescriptors = [sortDescriptor]
    do {
        tasks = try context.fetch(fetchReques)
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    
    for task in tasks {
        taskArray.append(task.title!)
    }
    
    return taskArray
}
