import SwiftUI

struct DailyCheckInView: View {
    @State private var didCompleteToday: Bool? = nil
    @State private var reasonMissed: String = ""
    @State private var today = Date()
    
    // Navigation triggers
    @State private var navigateToWeeklyReflection = false
    @State private var showPastInsights = false
    @State private var showArchiveHabit = false

    var body: some View {
        NavigationStack { // Make sure NavigationStack wraps everything
            VStack(spacing: 30) {
                Text("Today is \(formattedDate(today))")
                    .foregroundColor(.secondary)
                
                // Yes / No buttons
                HStack(spacing: 40) {
                    Button("✅ Yes") { didCompleteToday = true }
                        .padding()
                        .frame(maxWidth: 100)
                        .background(didCompleteToday == true ? Color.green.opacity(0.7) : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                    Button("❌ No") { didCompleteToday = false }
                        .padding()
                        .frame(maxWidth: 100)
                        .background(didCompleteToday == false ? Color.red.opacity(0.7) : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                // Optional “why not?”
                if didCompleteToday == false {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Why not?")
                            .font(.headline)
                        TextEditor(text: $reasonMissed)
                            .frame(height: 120)
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
                    }
                }
                
                Spacer()
                
                Button("Submit") {
                    submitCheckIn()
                    navigateToWeeklyReflection = true // Trigger navigation
                }
                .buttonStyle(.borderedProminent)
                .disabled(didCompleteToday == nil)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Daily Check-In")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("View Past Insights") { showPastInsights = true }
                        Button("Archive Habit") { showArchiveHabit = true }
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
            // Navigation destinations
            .navigationDestination(isPresented: $navigateToWeeklyReflection) {
                WeeklyReflectionView()
            }
            .navigationDestination(isPresented: $showPastInsights) {
                PastInsightsView()
            }
            .navigationDestination(isPresented: $showArchiveHabit) {
                ArchiveHabitView()
            }
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
    
    func submitCheckIn() {
        if let completed = didCompleteToday {
            print("Date:", formattedDate(today))
            print("Did complete:", completed)
            if !completed { print("Reason missed:", reasonMissed) }
        }
    }
}

// MARK: - Placeholder views

struct PastInsightsView: View {
    var body: some View {
        Text("Past Insights")
            .font(.title)
    }
}

struct ArchiveHabitView: View {
    var body: some View {
        Text("Archive Habit / Switch Habit")
            .font(.title)
    }
}

struct DailyCheckInView_Previews: PreviewProvider {
    static var previews: some View {
        DailyCheckInView()
    }
}
