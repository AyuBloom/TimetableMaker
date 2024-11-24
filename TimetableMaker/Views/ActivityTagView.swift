//
//  ActivityTagView.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import SwiftUI

struct ActivityTagView: View {
    var activity: Activity
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Button(activity.name, systemImage: "multiply") {
            withAnimation {
                modelContext.delete(activity)
            }
        }
        .padding(5)
        .foregroundStyle(.white)
        .background(Color[activity.color])
    }
}

#Preview {
    ActivityTagView(activity: Activity(color: "blue", name: "skibidi"))
}
