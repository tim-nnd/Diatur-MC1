//
//  RingData.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 13/04/21.
//

import Foundation

struct RingDatabase {
    static var ringArray: [Ring] = [
        
        Ring(workTime: 9, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/12 12:12")!
            return dateTime
        }()
        ),
        Ring(workTime: 7, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/13 12:12")!
            return dateTime
        }()
        ),
        Ring(workTime: 8, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/14 12:12")!
            return dateTime
        }()
        ),
        Ring(workTime: 5, date: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateTime = formatter.date(from: "2021/04/15 12:12")!
            return dateTime
        }()
        )
    ]
}
