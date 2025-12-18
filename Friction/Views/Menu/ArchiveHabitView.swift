//
//  ArchiveHabitView.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct ArchiveHabitView: View {
    // Mock active and past habits
    @State private var currentHabit = "Read 20 minutes"
    @State private var pastHabits = ["Meditate 10 min", "Journal daily", "Stretch 15 min"]
    
    @State private var selectedHabit: String? = nil
    @State private var archived = false
    
    var body: some View {
        VStack(spacing: 20) {
            if !archived {
                Text("Current Habit: \(currentHabit)")
                    .font(.headline)
                Button("Archive Habit") {
                    archived = true
                }
                .buttonStyle(.borderedProminent)
            } else {
                Text("Select a past habit to activate:")
                    .font(.headline)
                
                List(pastHabits, id: \.self) { habit in
                    HStack {
                        Text(habit)
                        Spacer()
                        if selectedHabit == habit {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedHabit = habit
                        currentHabit = habit
                        archived = false
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Archive Habit")
    }
}

struct ArchiveHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ArchiveHabitView()
        }
    }
}
