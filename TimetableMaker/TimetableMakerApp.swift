//
//  TimetableMakerApp.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import SwiftUI
import SwiftData

@main
struct TimetableMakerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            _Item.self,
            Activity.self,
            DaySchedule.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
