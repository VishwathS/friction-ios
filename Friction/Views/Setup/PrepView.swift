//
//  PrepView.swift
//  Friction
//
//  Created by Archana Shrishti Shankar on 12/17/25.
//

import Foundation
import SwiftUI

struct PrepView: View {
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("You're not trying to be perfect.")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Text("You're collecting data so you can fix your system.")
                .font(.headline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            NavigationLink {
                DailyCheckInView() // Placeholder for your first daily check-in screen
            } label: {
                Text("Start Daily Check-In")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
        }
        .padding()
    }
}

struct PrepView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PrepView()
        }
    }
}
