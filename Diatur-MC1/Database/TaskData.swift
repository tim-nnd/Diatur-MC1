//
//  TaskData.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 12/04/21.
//

import Foundation

struct TaskDatabase {
    static var taskArray: [Task] = [
        Task(name: "Code DatePicker", priority: 0, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/14 12:12")!
            return dateTime
        }(), notes: "Code the UIDatePicker and actions when interacted for the summary page"),
        Task(name: "Ngoding Dulu", priority: 0),
        Task(name: "Ahayy Ngoding", priority: 2),
        Task(name: "Lagi MC1.2 Brooow", priority: 1),
        Task(name: "LAGI UTS NICH", priority: 1)
    ]
}


