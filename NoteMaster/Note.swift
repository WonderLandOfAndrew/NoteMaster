//
//  Note.swift
//  NoteMaster
//
//  Created by Andrei Tone on 05.07.2024.
//

import Foundation
import SwiftData

@Model
final class Note: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var createdAt: Date
    
    init(id: UUID = UUID(), title: String, description: String, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.content = description
        self.createdAt = createdAt
    }
}

extension Note {
    static var emptyList: [Note] {[]}
    static var mockData: [Note] {
        [
            Note(title: "Grocery List", description:
                "Milk, Eggs, Bread, Butter", createdAt:
                    Date().addingTimeInterval(-100000)),
            Note(title: "Meeting List", description:
                "Discuss project roadmap, assugb tasks,", createdAt:
                    Date().addingTimeInterval(-200000)),
            Note(title: "Workout routine", description:
                "Monday: Cardio, Tuesday: Strenght", createdAt:
                    Date().addingTimeInterval(-300000)),
            Note(title: "Book Recommendations", description:
                "The Alchemist, 1984, To Kill a Mockingbird", createdAt:
                    Date().addingTimeInterval(-400000)),
            Note(title: "Travel Plan", description:
                "Tickets, Hotel booking, Itinerary", createdAt:
                    Date().addingTimeInterval(-500000))
        ]
    }
}
