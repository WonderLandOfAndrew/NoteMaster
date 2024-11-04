//
//  NoteSheet.swift
//  NoteMaster
//
//  Created by Andrei Tone on 19.07.2024.
//

import SwiftUI
import SwiftData

extension View {
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true:
            self.hidden()
        case false:
            self
        }
    }
}

struct NoteSheet: View {
    // @State private var title = ""
    // @State private var description = ""
    @Bindable var note: Note
    @FocusState private var isDescriptionFocused: Bool
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $note.title)
                    .font(.headline)
                    .padding()

                Divider()
                    .padding()

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $note.content)
                        .padding(.horizontal)
                        .focused($isDescriptionFocused)

                    Text("Description")
                        .fontWeight(.light)
                        .foregroundColor(.black.opacity(0.25))
                        .padding(.horizontal)
                        .hidden(isDescriptionFocused || !$note.wrappedValue.content.isEmpty)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    AnyView(
                        Button("Cancel") {
                            dismiss()
                        }
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .gray, radius: 5)
                    )
                }

                ToolbarItemGroup(placement: .topBarTrailing) {
                    AnyView(
                        Button(action: {
                            // Save the note inside our database
                            if !$note.title.wrappedValue.isEmpty && !$note.content.wrappedValue.isEmpty {
                                context.insert(note)
                                dismiss()
                            }
                        }) {
                            HStack {
                                Spacer()
                                Text("Save")
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .gray, radius: 5)
                    )
                }
            }

        }
    }
}

#Preview {
    NoteSheet(note: Note(title: "", description: "", createdAt: Date.now))
}
