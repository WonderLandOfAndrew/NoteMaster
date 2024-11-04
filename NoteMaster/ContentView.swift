//
//  ContentView.swift
//  NoteMaster
//
//  Created by Andrei Tone on 05.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var notes = Note.mockData
    @State private var isShowingSheet = false
    @State private var selectedNote: Note = Note(title: "", description: "")
    @Environment(\.modelContext) var context
    
    @Query(sort: \Note.title) var swiftDataNotes: [Note]
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(
                            LinearGradient(gradient:Gradient(colors: [Color.green.opacity(0.8), Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                        .frame(height: geometry.size.height / 2)
                        .overlay (
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.white.opacity(0.8))
                                .frame(width: .infinity, height: 200)
                                .overlay(
                                    HStack {
                                        VStack(alignment:
                                                .leading,
                                               spacing: 15
                                        ){
                                            Text("Welcome to NoteMaster")
                                                .font(.system(size:24, weight: .bold))
                                            Text("Your personal space for capturing ideas, thoughts and reminders")
                                                .font(.subheadline)
                                        }
                                        Spacer()
                                        Image(systemName: "applepencil.and.scribble")
                                            .imageScale(.large)
                                            .font(
                                                .system(size: 40))
                                    }
                                        .padding()
                                )
                                .padding()
                                .foregroundColor(.gray)
                    )
                    ForEach(swiftDataNotes) { note in
                            NoteRow (note: note)
                            .onTapGesture {
                                selectedNote = note
                                isShowingSheet = true
                            }
                            .contextMenu {
                                Button(action: {
                                    context.delete(note)
                                }){
                                    Text("Delete")
                                        .foregroundStyle(Color.red)
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
            }
            .sheet(isPresented : $isShowingSheet){
                NoteSheet(note: selectedNote)
                    .presentationDetents([.fraction(0.7), .large])
            }
            .background(Color.gray.opacity(0.1))
            .overlay{
                if (swiftDataNotes.isEmpty) {
                    ContentUnavailableView(
                        label: {
                            Label {
                                Text("No Notes")
                            } icon: {
                                Image(systemName: "doc.plaintext")
                                    .foregroundColor(Color.blue)
                            }
                        }
                    )
                    .offset(y: 120)
                }
                
            }
            .overlay(
                HStack {
                    Spacer()
                    Button(action : {isShowingSheet = true
                        selectedNote = Note(title: "", description: "", createdAt: Date())}){
                        
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color:Color.blue, radius: 15)
                    }
                }.padding(),
                alignment: .bottomTrailing
            )

        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
