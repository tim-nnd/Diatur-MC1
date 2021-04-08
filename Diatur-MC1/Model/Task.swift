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
    var timeElapsed: TimeInterval
    var date: Date
    var notes: String
    
    init(name: String, priority: Int, timeElapsed: TimeInterval, date: Date, notes: String) {
        self.name = name
        self.priority = priority
        self.timeElapsed = timeElapsed
        self.date = date
        self.notes = notes
    }
}
