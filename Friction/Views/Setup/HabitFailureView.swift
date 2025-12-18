//
//  HabitFailureView.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct HabitFailureView: View {
    @Binding var habit: HabitDraft

    let failureOptions = [
        "I forget",
        "I'm too tired",
        "I get distracted",
        "I feel overwhelmed",
        "I run out of time",
        "I don't feel motivated",
        "No accountability",
        "My environment makes it hard"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text("When does this habit usually fail?")
                .font(.title)

            Text("Pick anything that applies. This helps us design a better system.")
                .foregroundColor(.secondary)

            // Failure chips
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))], spacing: 12) {
                ForEach(failureOptions, id: \.self) { option in
                    FailureChip(
                        label: option,
                        isSelected: habit.failureTags.contains(option)
                    ) {
                        toggle(option)
                    }
                }
            }

            Text("Anything else?")
                .font(.headline)

            TextEditor(text: $habit.failureNotes)
                .frame(height: 120)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.4))
                )

            Spacer()

            Button("Next") {
                print("Failure tags:", habit.failureTags)
                print("Failure notes:", habit.failureNotes)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    func toggle(_ option: String) {
        if habit.failureTags.contains(option) {
            habit.failureTags.remove(option)
        } else {
            habit.failureTags.insert(option)
        }
    }
}
