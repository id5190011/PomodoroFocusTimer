//
//  TaskList.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit
import CoreData

class TaskList: UITableViewController {
    
    // MARK: - Propety
    
    var tasks: [Task] = []
    var timer = Timer()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Заглушка
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(reloadTableview), userInfo: nil, repeats: true)

        setUpTaskListUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchReques: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchReques.sortDescriptors = [sortDescriptor]
        do {
            tasks = try context.fetch(fetchReques)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell

        let taskItem = tasks[indexPath.row]
        cell.configureCell(object: taskItem)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            if tasks.count == 1 {
                alert(title: "Error", message: "You cannot delete a single task!")
            }  else {
                let deletingTask = tasks[indexPath.row]
                
                context.delete(deletingTask)
                do {
                    try context.save()
                } catch let error as NSError {
                    print (error.localizedDescription)
                }
                
                tasks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                taskArray = createTaskArray()
            }
        }
    }
    
    // MARK: - IB Action
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        addNewTask()
    }
    
    // MARK: - Functions
    
    @objc private func reloadTableview() {
        tableView.reloadData()
    }
}


