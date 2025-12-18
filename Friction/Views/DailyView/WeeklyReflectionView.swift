//
//  WeeklyReflectionView.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct WeeklyReflectionView: View {
    @State private var today = Date()
    
    // For demo: week ends on Sunday
    private var weekEnd: Date {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: today)
        // weekday: 1 = Sunday, 2 = Monday, ..., 7 = Saturday
        let daysUntilSunday = 1 - weekday
        return calendar.date(byAdding: .day, value: daysUntilSunday < 0 ? 7 + daysUntilSunday : daysUntilSunday, to: today)!
    }
    
    private var daysRemaining: Int {
        let calendar = Calendar.current
        let remaining = calendar.dateComponents([.day], from: today, to: weekEnd).day ?? 0
        return max(remaining, 0)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Weekly Reflection")
                .font(.title)
                .bold()
            
            if daysRemaining > 0 {
                Text("Unlocks in \(daysRemaining) day\(daysRemaining > 1 ? "s" : "")")
                    .font(.headline)
                    .foregroundColor(.secondary)
            } else {
                // Fake AI summary
                VStack(alignment: .leading, spacing: 15) {
                    Text("Your weekly AI summary")
                        .font(.headline)
                    
                    Text("Patterns identified:")
                        .bold()
                    Text("• You tend to skip habits on late nights")
                    Text("• Workload spikes cause missed sessions")
                    
                    Text("Suggested system change:")
                        .bold()
                    Text("Shift your habit to the morning or after lunch to reduce friction")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct WeeklyReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReflectionView()
    }
}
