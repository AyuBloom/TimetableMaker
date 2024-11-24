//
//  Item.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import Foundation
import SwiftData

@Model
final class _Item {
    var timestamp: Date
    var name: String = "New Timetable"
    var timetable: [DaySchedule] = [
        DaySchedule(day: "Monday"),
        DaySchedule(day: "Tuesday"),
        DaySchedule(day: "Wednesday"),
        DaySchedule(day: "Thursday"),
        DaySchedule(day: "Friday"),
        DaySchedule(day: "Saturday"),
        DaySchedule(day: "Sunday")
    ]
    
    init(timestamp: Date, name: String) {
        self.timestamp = timestamp
        self.name = name
    }
    
    public func addActivityToDay(_ activity: Activity, at index: Int) {
        timetable[index].activities.append([activity.name, activity.color, NSUUID().uuidString])
    }
}
