//
//  DaySchedule.swift
//  TimetableMaker
//
//  Created by AyuBloom on 23/11/2024.
//

import Foundation
import SwiftData

@Model
final class DaySchedule {
    var day: String
    var activities: [[String]]

    init(day: String, activities: [[String]] = []) {
        self.day = day
        self.activities = activities
    }
}
