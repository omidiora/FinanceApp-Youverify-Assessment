import SwiftUI

struct PrimaryButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button(title) {
            action()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.primaryTeal)
        .foregroundColor(.white)
        .cornerRadius(35)
        .font(.headline)
    }
}

