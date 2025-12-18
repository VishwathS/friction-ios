//
//  DailyCheckInView.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct DailyCheckInView: View {
    @State private var didCompleteToday: Bool? = nil
    @State private var reasonMissed: String = ""
    
    @State private var today = Date()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Daily Check-In")
                .font(.title)
                .bold()
            
            Text("Today is \(formattedDate(today))")
                .foregroundColor(.secondary)
            
            // Yes / No buttons
            HStack(spacing: 40) {
                Button(action: {
                    didCompleteToday = true
                }) {
                    Text("✅ Yes")
                        .padding()
                        .frame(maxWidth: 100)
                        .background(didCompleteToday == true ? Color.green.opacity(0.7) : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    didCompleteToday = false
                }) {
                    Text("❌ No")
                        .padding()
                        .frame(maxWidth: 100)
                        .background(didCompleteToday == false ? Color.red.opacity(0.7) : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            
            // Free text if they missed it
            if didCompleteToday == false {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Why not?")
                        .font(.headline)
                    
                    TextEditor(text: $reasonMissed)
                        .frame(height: 120)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.4))
                        )
                }
            }
            
            Spacer()
            
            Button("Submit") {
                submitCheckIn()
            }
            .buttonStyle(.borderedProminent)
            .disabled(didCompleteToday == nil) // Only enable if user selects Yes or No
        }
        .padding()
    }
    
    // MARK: - Helpers
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
    
    func submitCheckIn() {
        // For now, just print to console
        if let completed = didCompleteToday {
            print("Date:", formattedDate(today))
            print("Did complete:", completed)
            if !completed {
                print("Reason missed:", reasonMissed)
            }
        }
        
        // Here you can later store this in HabitDraft or persistent storage
    }
}

struct DailyCheckInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DailyCheckInView()
        }
    }
}
