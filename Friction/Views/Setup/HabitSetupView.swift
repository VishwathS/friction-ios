//
//  HabitSetupView.swift
//  Friction
//
//  Created by Vishwath Shankar on 12/17/25.
//

import SwiftUI

struct HabitSetupView: View {
    @State private var habitDraft = HabitDraft()   // Single source of truth

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text("Diagnose a Habit")
                .font(.title)

            Text("What habit do you want to work on?")
                .font(.headline)

            // Bind to habitDraft.name
            TextField("e.g. Read 20 minutes", text: $habitDraft.name)
                .textFieldStyle(.roundedBorder)

            Text("How many days per week?")
                .font(.headline)

            // Bind to habitDraft.daysPerWeek
            Stepper(value: $habitDraft.daysPerWeek, in: 1...7) {
                Text("\(habitDraft.daysPerWeek) days per week")
            }

            Text("Which days? (optional)")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(1...7, id: \.self) { day in
                    DayButton(
                        label: dayLabel(for: day),
                        isSelected: habitDraft.selectedDays.contains(day)
                    ) {
                        toggleDay(day)
                    }
                }
            }

            Spacer()

            // NavigationLink or button logic
            NavigationLink {
                HabitReasonView(habit: $habitDraft)
            } label: {
                Text("Next")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    // MARK: - Helpers

    func toggleDay(_ day: Int) {
        if habitDraft.selectedDays.contains(day) {
            habitDraft.selectedDays.remove(day)
        } else {
            habitDraft.selectedDays.insert(day)
        }
    }

    func dayLabel(for day: Int) -> String {
        ["M", "T", "W", "T", "F", "S", "S"][day - 1]
    }
}
