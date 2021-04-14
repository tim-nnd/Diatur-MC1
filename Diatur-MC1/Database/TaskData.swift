//
//  TaskData.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 12/04/21.
//

import Foundation

struct TaskDatabase {
    static var taskArray: [Task] = [
//        Tanggal 13
        Task(name: "Create Storyboard", priority: 0, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/13 12:12")!
            return dateTime
        }(), notes: "Create the storyboards needed for the project", isCompleted: true),
        
        Task(name: "Insert UI Elements", priority: 1, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/13 12:12")!
            return dateTime
        }(), notes: "Insert the UI Elements to the storyboards", isCompleted: true),
        
//        Tanggal 14
        Task(name: "Code DatePicker", priority: 0, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/14 12:12")!
            return dateTime
        }(), notes: "Code the UIDatePicker and actions when interacted for the summary page"),
        
        Task(name: "Code Progress Ring", priority: 1, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/14 15:12")!
            return dateTime
        }(), notes: "Code the Progress ring and animation when interacted for the summary page and main page"),
            
        Task(name: "Do a Paper work", priority: 2, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/14 16:12")!
            return dateTime
        }(), notes: "Complete the administration for company order submission"),
        
        Task(name: "Applying color to 3d model", priority: 2, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/14 17:12")!
            return dateTime
        }(), notes: "Working on 3D model design colouring that already created"),
        
//        Tanggal 15
        Task(name: "Code Timer", priority: 0, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/15 12:12")!
            return dateTime
        }(), notes: "Code the Timer and actions when interacted for the task detail page"),
        
        Task(name: "Get Research Data", priority: 2, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/15 15:12")!
            return dateTime
        }(), notes: "Get the data from the result of interview "),
        
        Task(name: "Analyse data for research", priority: 2, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/15 16:12")!
            return dateTime
        }(), notes: "Analysing data gathered from the the interview"),
        
        Task(name: "Cleaning data for research", priority: 1, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/15 17:12")!
            return dateTime
        }(), notes: "Cleansing the data gathered from the the interview before"),
        
        
//        Tanggal 16
        Task(name: "Revision UI Design", priority: 1, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/16 12:12")!
            return dateTime
        }(), notes: "Redesign visualisation the stepper to picker design on first time"),
        
        Task(name: "Business Presentation", priority: 0, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/16 16:12")!
            return dateTime
        }(), notes: "Create the Keynotes for the presentation and practice presentate"),
        
        Task(name: "Finalising Code DatePicker", priority: 2, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/16 16:12")!
            return dateTime
        }(), notes: "Continue the code and push to git"),
        
        Task(name: "Order Office Dinner Together", priority: 2, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/16 17:12")!
            return dateTime
        }(), notes: "Ordering foods for office dinner party")
    ]
}
