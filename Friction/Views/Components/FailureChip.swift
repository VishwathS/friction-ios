//
//  FailureChip.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct FailureChip: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue.opacity(0.8) : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}
