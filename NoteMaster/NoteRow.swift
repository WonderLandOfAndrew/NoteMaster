//
//  NoteRow.swift
//  NoteMaster
//
//  Created by Andrei Tone on 05.07.2024.
//

import SwiftUI

struct NoteRow: View {
    let  note: Note
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(note.title)
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 30)
                    .foregroundColor(.blue)
                    .shadow(color: Color.gray, radius: 2)
            }
            .padding([.top, .horizontal])
            
            Text(note.content)
                .font(.body)
                .lineLimit(1)
                .padding([.bottom, .horizontal])
                .padding(.horizontal)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    NoteRow(note: Note(title: "Daniel Hotel", description: "Enjoy your stay", createdAt: Date()))
}
