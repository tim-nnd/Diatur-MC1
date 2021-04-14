//
//  Task.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 07/04/21.
//

import Foundation

class Task {
    var name: String
    var priority: Int
    var timeElapsed: TimeInterval = 0
    var date: Date
    var notes: String
    var isCompleted: Bool
    
    init(name: String, priority: Int, date: Date, notes: String) {
        self.name = name
        self.priority = priority
        self.date = date
        self.notes = notes
        self.isCompleted = false
    }
    
    init(name: String, priority: Int, date: Date, notes: String, isCompleted: Bool) {
        self.name = name
        self.priority = priority
        self.date = date
        self.notes = notes
        self.isCompleted = isCompleted
    }
    
    //Init Overview
    init(name: String, priority: Int) {
        let dateData = "2021-04-20"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
      
       
        self.name = name
        self.priority = priority
        self.timeElapsed = Double(0)
        self.date =  dateFormatter.date(from: dateData)!
        self.notes = "notes"
        self.isCompleted = false
    }
}
