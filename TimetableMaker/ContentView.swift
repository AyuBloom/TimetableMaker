//
//  ContentView.swift
//  TimetableMaker
//
//  Created by AyuBloom on 20/11/2024.
//

import SwiftUI
import SwiftData

extension Color {
    static subscript(name: String) -> Color {
        switch name {
            case "purple":
                return Color.purple
            case "blue":
                return Color.blue
            case "green":
                return Color.green
            case "yellow":
                return Color.yellow
            case "orange":
                return Color.orange
            case "red":
                return Color.red
            default:
                return Color.gray
        }
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [_Item]
    
    @State private var isShowingSheet: Bool = false
    @State private var isShowingDialog: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        MainContentView(item: item)
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundStyle(Color.accentColor)
                            VStack(alignment: .leading) {
                                Text(item.name)
                                Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                                    .font(.system(size: 10))
                                    .opacity(0.5)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            #if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200, max: 250)
            #endif
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                #endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                    
                    .sheet(isPresented: $isShowingSheet, content: {
                        NavigationStack {
                            AddNewTimetable();
                        }
                        .presentationDetents([.fraction(0.15)])
                    })
                }
            }
            HStack() {
                Image(systemName: "camera.macro")
                    .foregroundStyle(Color.accentColor)
                Text("AyuBloom")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            #if os(macOS)
            .padding([.bottom, .trailing], 10)
            #elseif os(iOS)
            .padding(.trailing, 20)
            #endif
            .opacity(0.2)
            .scaledToFit()
        } detail: {
            Image(systemName: "calendar")
                .font(.system(size: 100))
                .opacity(0.1)
        }
        .navigationTitle("Timetable")
    }

    private func addItem() {
        isShowingSheet = true
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [_Item.self, Activity.self, DaySchedule.self])
}
