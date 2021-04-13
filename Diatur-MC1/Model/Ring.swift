//
//  Rings.swift
//  Diatur-MC1
//
//  Created by Azka Kusuma on 07/04/21.
//

import Foundation

class Ring {
    var workTime: Int
    var date: Date
    
    init() {
        self.workTime = 0
        self.date = Date()
    }
    
    init(date: Date) {
        self.workTime = 0
        self.date = date
    }
    
    init(workTime: Int, date: Date) {
        self.workTime = workTime
        self.date = date
    }
    
    func todayLifeTime() -> Int {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour-workTime
    }
    
    func summaryLifeTime() -> Int {
        return 24 - workTime
    }
}
