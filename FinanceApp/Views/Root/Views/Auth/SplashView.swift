import SwiftUI

struct SplashView: View {
    let onComplete: () -> Void
    
    var body: some View {
        ZStack {
            Color.primaryTeal.ignoresSafeArea()
          
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
