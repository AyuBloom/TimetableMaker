//
//  TimetableWidget.swift
//  TimetableWidget
//
//  Created by AyuBloom on 20/11/2024.
//

import WidgetKit
import SwiftUI

/*
struct SelectCharacterIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select Character"
    static var description = IntentDescription("Selects the character to display information for.")


    @Parameter(title: "Character")
    var character: CharacterDetail


    init(character: CharacterDetail) {
        self.character = character
    }


    init() {
    }


}
*/

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 1 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct TimetableWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

struct TimetableWidget: Widget {
    let kind: String = "Timetable Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind/*, intent: Item.self */, provider: Provider()) { entry in
            TimetableWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Timetable Widget")
        .description("Displays your timetable.")
    }
}

#Preview(as: .systemMedium) {
    TimetableWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
