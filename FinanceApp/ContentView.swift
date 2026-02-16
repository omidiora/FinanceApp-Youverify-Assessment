import SwiftUI

struct ContentView: View {
    @State private var screen: Screen = .splash

    enum Screen {
        case splash, onboarding, signUp, verification, signIn, setPasscode, home
    }

    var body: some View {
        switch screen {
        case .splash:
            SplashView {
                screen = .onboarding
            }
        case .onboarding:
            OnboardingView {
                screen = .signUp
            } onSkip: {
                screen = .signIn
            }
        case .signUp:
            SignUpView {
                screen = .verification
            } onLoginTap: {
                screen = .signIn
            }
        case .verification:
            VerificationView {
                screen = .setPasscode
            }
        case .signIn:
            SignInView {
                screen = .home
            }
        case .setPasscode:
            SetPasscodeView {
                screen = .home
            }
        case .home:
            Text("🏠 Home Screen") // Placeholder for your actual HomeView
        }
    }
}

#Preview {
    ContentView()
}

