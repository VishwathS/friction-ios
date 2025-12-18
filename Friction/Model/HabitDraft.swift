//
//  HabitDraft.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation

struct HabitDraft {
    var name: String = ""
    var daysPerWeek: Int = 5
    var selectedDays: Set<Int> = []
    var reason: String = ""

    var failureTags: Set<String> = []
    var failureNotes: String = ""
}
