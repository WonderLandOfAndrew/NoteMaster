//
//  NoteMasterApp.swift
//  NoteMaster
//
//  Created by Andrei Tone on 05.07.2024.
//

import SwiftUI
import SwiftData

@main
struct NoteMasterApp: App {
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Note.self)
        } catch {
            fatalError("Could not initialise ModelContainer")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
                .modelContainer(modelContainer)
        
    }
}
