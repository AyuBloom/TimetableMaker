//
//  AddNewActivity.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import SwiftUI

struct AddNewActivity: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var activity: String = ""
    @State private var color: String = "gray"
    var body: some View {
        HStack {
            TextField("ohio sigma rizz", text: $activity)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                #if os(macOS)
                .frame(maxWidth: 180)
                #endif
            Picker("Color", selection: $color) {
                Text("Gray").tag("gray")
                Text("Red").tag("red")
                Text("Orange").tag("orange")
                Text("Yellow").tag("yellow")
                Text("Green").tag("green")
                Text("Blue").tag("blue")
            }
            #if os(macOS)
            .frame(maxWidth: 120)
            #endif
        }
        #if os(macOS)
        .frame(maxWidth: 300)
        #endif
        .padding()
        .navigationTitle("New Activity")
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
                    if (activity != "") {
                        withAnimation {
                            let newActivity = Activity(color: color, name: activity)
                            modelContext.insert(newActivity)
                            try! modelContext.save()
                        }
                        dismiss();
                    }
                }) {
                    Label("Add", systemImage: "plus");
                }
                .padding()
            })
        }
        #endif
        #if os(macOS)
        HStack {
            Button("Cancel") {
                dismiss();
            }
            .keyboardShortcut(.cancelAction)
            Spacer()
            Button(action: {
                if (activity != "") {
                    withAnimation {
                        let newActivity = Activity(color: color, name: activity)
                        modelContext.insert(newActivity)
                        try! modelContext.save()
                    }
                    dismiss();
                }
            }) {
                Label("Add", systemImage: "plus");
            }
            .keyboardShortcut(.defaultAction)
        }
        .padding(.bottom, 20)
        .frame(maxWidth: 300)
        #endif
    }
}

#Preview {
    NavigationStack {
        AddNewActivity()
    }
}
