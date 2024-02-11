//
//  ExpenseTrackerApp_TutorialApp.swift
//  ExpenseTrackerApp_Tutorial
//
//  Created by Giovanni Ercolano on 11/02/24.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp_TutorialApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
