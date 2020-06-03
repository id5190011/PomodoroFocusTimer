//
//  TaskSettings.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 02.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TaskSettings: UITableViewController {
    
    // MARK: - Properties
    var workIntervalValue: String!
    var breakIntervalValue: String!
    
    // MARK: - IB Outlets
    
    @IBOutlet var workIntervalLabel: UILabel!
    @IBOutlet var breakIntervalLabel: UILabel!
    
    @IBOutlet var workIntervalTextField: UITextField!
    @IBOutlet var breakIntervalTextField: UITextField!
    
    @IBOutlet var redSchemeButton: UIButton!
    @IBOutlet var yellowSchemeButton: UIButton!
    @IBOutlet var greenSchemeButton: UIButton!
    @IBOutlet var blueSchemeButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSettingsUI()
        
        fillIntervalSettings()
        
        addDoneButton(workIntervalTextField)
        addDoneButton(breakIntervalTextField)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor = CustomColor.darkGray
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func workIntervalBeginEditing(_ sender: UITextField) {
        workIntervalValue = workIntervalTextField.text
        workIntervalTextField.placeholder = workIntervalValue
        workIntervalTextField.text = ""
    }
    
    @IBAction func workIntervalEndEditing(_ sender: UITextField) {
        workIntervalEndEditing()
    }
    
    
    @IBAction func breakIntervalBeginEditing(_ sender: UITextField) {
        breakIntervalValue = breakIntervalTextField.text
        breakIntervalTextField.placeholder = breakIntervalValue
        breakIntervalTextField.text = ""
    }
    
    
    @IBAction func breakIntervalEndEditing(_ sender: UITextField) {
        breakIntervalEndEditing()
    }
    
    @IBAction func redSchemeButtonAction(_ sender: UIButton) {
        applyChangesAndShowAlert(color: "red")
    }
    
    @IBAction func yellowSchemeButtonAction(_ sender: UIButton) {
        applyChangesAndShowAlert(color: "yellow")
    }
    
    @IBAction func greenSchemeButtonAction(_ sender: UIButton) {
        applyChangesAndShowAlert(color: "green")
    }
    
    @IBAction func blueSchemeButtonAction(_ sender: UIButton) {
        applyChangesAndShowAlert(color: "blue")
    }
}
