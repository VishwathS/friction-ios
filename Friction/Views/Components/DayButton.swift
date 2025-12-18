//
//  DayButton.swift
//  Friction
//
//  Created by Vishwath Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct DayButton: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.subheadline)
                .frame(width: 36, height: 36)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .clipShape(Circle())
        }
    }
}
