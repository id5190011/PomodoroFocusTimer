//
//  TaskCell.swift
//  PomodoroFocusTimer
//
//  Created by Valeriy Pokatilo on 01.06.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet var taskTitle: UILabel!
    @IBOutlet var taskIntervalCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(object: Task) {
        taskTitle.text = object.title
        taskIntervalCounter.text = String(object.counter)

        setUpTaskCellUI()
    }
}
