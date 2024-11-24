//
//  MainContentView.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import SwiftUI
import SwiftData

let DAYS_OF_WEEK: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

enum DAYS_OF_WEEK_TO_INDEX {
    static subscript (day: String) -> Int {
        switch day {
            case "Monday": return 0
            case "Tuesday": return 1
            case "Wednesday": return 2
            case "Thursday": return 3
            case "Friday": return 4
            case "Saturday": return 5
            case "Sunday": return 6
            default: return 0
        }
    }
}

struct MainContentView: View {
    let item: _Item
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var activities: [Activity]
    @State private var isShowingSheet: Bool = false
    
    private let timetable: [DaySchedule]
    
    init(item: _Item) {
        self.item = item
        self.timetable = item.timetable
    }
    
    var body: some View {
        Text(item.name)
            .font(.title)
            .padding()
        HStack {
            Grid() {
                ScrollView(.vertical) {
                    Divider()
                    ForEach(DAYS_OF_WEEK, id: \.self) { day in
                        GridRow {
                            ActivityListView(
                                item: self.item,
                                day: day,
                                timetable: self.timetable
                            )
                        }
                        Divider()
                    }
                }
            }
            Spacer()
        }
        .padding()
        Spacer()
        ScrollView(.horizontal) {
            HStack {
                Button("Add Activity", systemImage: "plus.circle.fill") {
                    isShowingSheet = true
                }
                .frame(maxHeight: 30)
                .keyboardShortcut(.defaultAction)
                .sheet(isPresented: $isShowingSheet, content: {
                    NavigationStack {
                        AddNewActivity();
                    }
#if os(iOS)
                    .presentationDetents([.fraction(0.15)])
#endif
                })
                .padding()
                ForEach(activities) { activity in
                    ActivityTagView(activity: activity)
                        .cornerRadius(5)
                        .frame(maxHeight: 30)
                }
                Spacer()
            }
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    MainContentView(item: _Item(timestamp: Date(), name: "skibidi dopdop"))
        .modelContainer(for: Activity.self)
}
