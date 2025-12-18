//
//  PastInsightsView.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct PastInsightsView: View {
    // Mock past weeks
    let pastWeeks = [
        ("Dec 1 - Dec 7", ["Skipped habits on late nights", "Workload spikes cause missed sessions"], "Shift habit to mornings"),
        ("Nov 24 - Nov 30", ["Forgot habit when stressed", "Evening routines disrupted"], "Use phone reminder before lunch"),
        ("Nov 17 - Nov 23", ["Skipped weekends", "Late nights"], "Move habit to weekday mornings")
    ]
    
    var body: some View {
        List {
            ForEach(pastWeeks, id: \.0) { week in
                VStack(alignment: .leading, spacing: 8) {
                    Text(week.0)
                        .font(.headline)
                    Text("Patterns:")
                        .bold()
                    ForEach(week.1, id: \.self) { pattern in
                        Text("• \(pattern)")
                    }
                    Text("Suggestion:")
                        .bold()
                    Text(week.2)
                        .italic()
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Past Insights")
    }
}

struct PastInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PastInsightsView()
        }
    }
}
