//
//  ActivityView.swift
//  TimetableMaker
//
//  Created by AyuBloom on 23/11/2024.
//

import SwiftUI

struct ActivityView: View {
    var item: _Item
    var day: String
    var activity: [String]
    
    var body: some View {
        Button(activity[0], systemImage: "multiply") {
            withAnimation {
                item.timetable[DAYS_OF_WEEK_TO_INDEX[day]].activities.removeAll(
                    where: { $0 == activity }
                )
            }
        }
        .padding(5)
        .foregroundStyle(.white)
        .background(Color[activity[1]])
    }
}

#Preview {
    ActivityView(
        item: _Item(timestamp: Date(), name: "skibidi dopdop"),
        day: "Monday",
        activity: ["skibidi", "blue", NSUUID().uuidString]
    )
}
