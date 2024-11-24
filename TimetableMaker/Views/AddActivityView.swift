//
//  AddActivityView.swift
//  TimetableMaker
//
//  Created by AyuBloom on 23/11/2024.
//

import SwiftUI
import SwiftData

struct AddActivityView: View {
    let item: _Item
    let day: String
    @Environment(\.modelContext) private var modelContext
    
    @Query private var activities: [Activity]
    @State private var selectedActivity: String = "Pick..."
    
    var body: some View {
        Menu("Options", systemImage: "plus.circle") {
            ForEach(activities) { activity in
                Button(activity.name) {
                    item.addActivityToDay(activity, at: DAYS_OF_WEEK_TO_INDEX[day])
                }
            }
        }
        .labelStyle(.iconOnly)
    }
}

#Preview {
    AddActivityView(
        item: _Item(timestamp: Date(), name: "skibidi dopdop"),
        day: "Sunday"
    )
    .modelContainer(for: Activity.self)
}
