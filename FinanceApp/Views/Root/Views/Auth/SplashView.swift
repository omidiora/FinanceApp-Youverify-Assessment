import SwiftUI

struct SplashView: View {
    let onComplete: () -> Void
    
    var body: some View {
        ZStack {
            Color.primaryTeal.ignoresSafeArea()
            
            Text("Fintrack")
                .font(.AppFont(20))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white) // 👈 white background only for text
                .cornerRadius(8) // optional (makes it look nicer)
                .foregroundColor(.multipleGreen)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                onComplete()
            }
        }
    }
}

#Preview {
    SplashView(onComplete: {})
}

