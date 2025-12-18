import SwiftUI

struct HabitReasonView: View {
    @Binding var habit: HabitDraft

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Why does it matter to you?")
                .font(.title)

            TextEditor(text: $habit.reason)
                .frame(height: 200)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5)))

            Spacer()

            NavigationLink {
                HabitFailureView(habit: $habit)
            } label: {
                Text("Next")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
