//
//  TaskList+AddNewTask.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 02.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit
import CoreData

extension TaskList {
    func addNewTask() {
        let alert = UIAlertController(title: "Add new task", message: "Enter task", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Save", style: .default) { action in
            
            let tf = alert.textFields?.first
            if let newTaskTitle = tf?.text {
                self.saveTask(withTitle: newTaskTitle)
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { _ in }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in })
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func saveTask(withTitle title: String) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
            else { return }
        
        let taskObject = Task(entity: entity, insertInto: context)
        
        taskObject.title = title
        taskObject.counter = 0
        // Сохранение
        do {
            try context.save()
            //tasks.append(taskObject)
            tasks.insert(taskObject, at: 0)
        } catch let error as NSError {
            print (error.localizedDescription)
        }
    }
}
