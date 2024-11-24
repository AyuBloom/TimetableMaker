//
//  ActivityListView.swift
//  TimetableMaker
//
//  Created by AyuBloom on 23/11/2024.
//

import SwiftUI

struct ActivityListView: View {
    let item: _Item
    let day: String
    let timetable: [DaySchedule]
    
    var body: some View {
        HStack {
            Text(day)
                .font(.headline)
                .frame(width: 80, alignment: .leading)
            AddActivityView(item: item, day: day)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(timetable[DAYS_OF_WEEK_TO_INDEX[day]].activities, id: \.self) { activity in
                        ActivityView(
                            item: item,
                            day: day,
                            activity: activity
                        )
                        .cornerRadius(5)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(height: 50)
    }
}

#Preview {
    ActivityListView(
        item: _Item(timestamp: Date(), name: "skibidi dopdop"),
        day: "Monday",
        timetable: _Item(timestamp: Date(), name: "skibidi dopdop").timetable
    )
}
