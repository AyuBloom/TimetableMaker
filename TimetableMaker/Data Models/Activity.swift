//
//  Activity.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import Foundation
import SwiftData

@Model
final class Activity {
    var color: String
    var name: String = "New Activity"
    
    init(color: String, name: String) {
        self.color = color
        self.name = name
    }
}
