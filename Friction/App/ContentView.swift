//
//  ContentView.swift
//  Friction
//
//  Created by Vishwath Shankar on 12/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("This app doesn’t help you try harder.")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text("It helps you change the system that keeps failing.")
                    .multilineTextAlignment(.center)

                NavigationLink("Diagnose a habit") {
                    // START
                    HabitSetupView()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
