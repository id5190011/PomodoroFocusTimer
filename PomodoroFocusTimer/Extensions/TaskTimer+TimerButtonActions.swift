//
//  TaskTimer+TimerButtonActions.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit
import CoreData

extension TaskTimer {
    
    func intervalManage() {
        if currentIntervalType {
            mainTimer = getSettingsDataInt(for: "workInterval")
            seconds = mainTimer
            timelabel.text = timeString(time: Double(mainTimer))
        } else {
            mainTimer = getSettingsDataInt(for: "breakInterval")
            seconds = mainTimer
            timelabel.text = timeString(time: Double(mainTimer))
        }
     }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
    }
    
    func pause() {
        timer.invalidate()
    }
    
    func skip() {
        timer.invalidate()
        
        if currentIntervalType {
            currentIntervalType = false
            mainTimer = getSettingsDataInt(for: "breakInterval")
            seconds = mainTimer
            timelabel.text = timeString(time: Double(mainTimer))
            
        } else {
            mainTimer = getSettingsDataInt(for: "workInterval")
            seconds = mainTimer
            currentIntervalType = true
            timelabel.text = timeString(time: Double(mainTimer))
        }
    }
    
    @objc private func countDownTimer() {
        seconds -= 1
        timelabel.text = timeString(time: TimeInterval(seconds))
        
        if (seconds == 0) {
            
            if currentIntervalType {
                currentIntervalType = false
                mainTimer = getSettingsDataInt(for: "breakInterval")
                seconds = mainTimer
                timelabel.text = timeString(time: TimeInterval(mainTimer))
                alertTimerTo(title: "Timer", message: "Time to break")
                counterIncrease()
            } else {
                mainTimer = getSettingsDataInt(for: "workInterval")
                seconds = mainTimer
                timelabel.text = timeString(time: TimeInterval(mainTimer))
                currentIntervalType = true
                alertTimerTo(title: "Timer", message: "Time to work")
            }
            
            timer.invalidate()
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func counterIncrease() {
        
        var taskPlus: Task!
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title = %@", currentTaskTextField.text!)
        
        do {
            let results = try context.fetch(fetchRequest)
            taskPlus = results.first
            //insertDataFrom(selectedCar: car!)
        } catch let error as NSError {
            print(error.localizedDescription )
        }
        
        taskPlus.title = currentTaskTextField.text!
        taskPlus.counter += 1
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func reloadTimerValue() {
        timeRealodTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(reloadTimerValueFunc), userInfo: nil, repeats: true)
    }
    
    @objc func reloadTimerValueFunc() {
        intervalManage()
    }

}
