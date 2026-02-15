import SwiftUI

// MARK: - Onboarding View
struct OnboardingView: View {
    let onComplete: () -> Void
    let onSkip: () -> Void
    
    @State private var currentPage = 0
    @State private var showCreateAccountSheet = false
    @State private var goToSignUp = false
    
    private let totalPages = 3
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // MARK: Pages
                TabView(selection: $currentPage) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        OnboardingPage(page: index)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // MARK: Overlay Controls
                VStack {
                    
                    // Top Dots
                    HStack {
                        Spacer()
                        HStack(spacing: 8) {
                            ForEach(0..<totalPages, id: \.self) { index in
                                Capsule()
                                    .fill(index == currentPage ? Color.primaryTeal : Color.gray.opacity(0.5))
                                    .frame(width: index == currentPage  ? 102 : 100, height: 8)
                                    .animation(.easeInOut(duration: 0.3), value: currentPage)
                            }
                        }
                        .frame(maxWidth: 150)
                        Spacer()
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    // Bottom Controls
                    VStack(spacing: 15) {
                        PrimaryButton(title: "Create an account") {
                            showCreateAccountSheet = true
                        }
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.secondary)
                            
                            Text("Sign In")
                                .foregroundColor(.multipleGreen)
                                .underline(true, color: .multipleGreen)
                                .onTapGesture {
                                    onSkip()
                                }
                        }
                        .font(.subheadline)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 50)
                }
            }
            .background(Color.white.ignoresSafeArea())
            
            // MARK: Sheet
            .sheet(isPresented: $showCreateAccountSheet) {
                CreateAccountSheet(
                    onCancel: {
                        showCreateAccountSheet = false
                    },
                    onCreate: {
                        showCreateAccountSheet = false
                        goToSignUp = true
                    }
                )
                .presentationDetents([.height(260)])
                .presentationDragIndicator(.visible)
            }
            
            // MARK: Navigation
            .navigationDestination(isPresented: $goToSignUp) {
                SignUpView(
                    onContinue: {
                        onComplete()
                    },
                    onLoginTap: {
                        onSkip()
                    }
                )
            }
        }
    }
}

////////////////////////////////////////////////////////////

// MARK: - Sheet
struct CreateAccountSheet: View {
    let onCancel: () -> Void
    let onCreate: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 54) {
                
                Text("By pressing accept below you agree to our Terms and Conditions. You can find out more about how we use your data in our Privacy Policy")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                
                PrimaryButton(title: "Accept And Continue") {
                    onCreate()
                }
                .padding(.horizontal, 30)
                
                Spacer(minLength: 40)
            }
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}

////////////////////////////////////////////////////////////

// MARK: - Onboarding Page
struct OnboardingPage: View {
    let page: Int
    
    private let titles = [
        "Track Your \n Expenses",
        "Set Savings \n Goals",
        "Get Financial \n Insights"
    ]
    
    private let subtitles = [
        "Track expenses, set budgets, and achieve your goals effortlessly.",
        "Automated savings and investment options tailored for you.",
        "Get weekly reports and insights on your spending habits."
    ]
    
    private let images = [
        "slide_1",
        "slide_2",
        "slide_3"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(titles[page])
                .font(.title)
                .bold()
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 40)
                
            
            Text(subtitles[page])
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Image(images[page])
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            Spacer()
        }
        .padding(.top, 100)
    }
}


#Preview {
    OnboardingView(onComplete: {}, onSkip: {})
}

