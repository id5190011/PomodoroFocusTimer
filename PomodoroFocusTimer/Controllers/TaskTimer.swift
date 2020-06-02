//
//  TaskTimer.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

public var taskArray: [String] = []

class TaskTimer: UIViewController {
    
    // MARK: - Propeties
    
    var currentIntervalType: Bool!
    var timer = Timer()
    var timeRealodTimer = Timer()
    var mainTimer: Int!
    var seconds: Int!
    var selectedPickerElement: String?


    // MARK: - IB Outlets
    
    @IBOutlet var currentTaskTextField: UITextField!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    
    // Удалить
    @IBOutlet var intervalTypeLabel: UILabel!
    @IBOutlet var firstLaunchLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTaskTimerUI()

        currentIntervalType = getCurrentIntervalType()
        intervalManage()
        
        choiceInterval(currentTaskTextField)
        addToolBar(currentTaskTextField)
        
        // TO-DO: - обновлять значения таймера при изменении настроек
    }
    
    // MARK: - IB Actions
    
    // for text field
    
    @IBAction func currentTaskEditing(_ sender: UITextField) {
        taskArray = createTaskArray()
    }
    
    @IBAction func currentTaskEndEditing(_ sender: UITextField) {
        if let pickedElement = selectedPickerElement {
            currentTaskTextField.text = pickedElement
            UserDefaults.standard.set(pickedElement, forKey: "lastTask")
        }
    }
    
    // for button
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        start()
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        pause()
    }
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
        skip()
    }
}
