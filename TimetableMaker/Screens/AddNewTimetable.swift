//
//  AddNewTimetable.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import SwiftUI

struct AddNewTimetable: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var text: String = ""
    var body: some View {
        VStack {
            TextField("skibidi timetable", text: $text)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
        }
        .padding()
        .navigationTitle("New Timetable")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button("Cancel") {
                    dismiss();
                }
            })
            ToolbarItem(placement: .topBarTrailing, content: {
                Button(action: {
                    withAnimation {
                        let newItem = _Item(timestamp: Date(), name: text)
                        modelContext.insert(newItem)
                    }
                    dismiss();
                }) {
                    Label("Add", systemImage: "plus");
                }
                .padding()
                .keyboardShortcut(.defaultAction)
            })
        }
        #endif
        #if os(macOS)
        HStack {
            Button("Cancel") {
                dismiss();
            }
            .keyboardShortcut(.cancelAction)
            Button(action: {
                withAnimation {
                    let newItem = _Item(timestamp: Date(), name: text)
                    modelContext.insert(newItem)
                }
                dismiss();
            }) {
                Label("Add", systemImage: "plus");
            }
            .keyboardShortcut(.defaultAction)
        }
        .padding(.bottom, 20)
        #endif
    }
    
}

#Preview {
    NavigationStack {
        AddNewTimetable()
    }
}
