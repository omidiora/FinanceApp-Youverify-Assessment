import SwiftUI

struct SignInView: View {
    let onComplete: () -> Void
    
    @State private var email = ""
    @State private var otp = ""
    @State private var isOTPMode = false
    @State private var goToSetPasscode = false   // 👈 navigation trigger
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(isOTPMode ? "Check your email!" : "Welcome back 🎉")
                        .font(.custom("Capriola-Regular", size: 24))
                        .transition(.opacity.combined(with: .move(edge: .top)))
                    
                    
                    Text(
                        isOTPMode
                        ? "We have sent an email to \(email). Please remember to check your inbox as well as the spam folder."
                        : "Sign in to your account and start managing your finances with Fintrack today."
                    )
                    .font(.AppFont(20))
                    .foregroundColor(.black)
                    .transition(.opacity)
                    
                    
                    Group {
                        if isOTPMode {
                            LabeledTextField(
                                label: "Enter one time passcode (OTP)",
                                placeholder: "Enter OTP",
                                text: $otp
                            )
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                            
                        } else {
                            LabeledTextField(
                                label: "Email address",
                                placeholder: "e.g email@mail.com",
                                text: $email,
                                autocapitalization: .none
                            )
                            .transition(.move(edge: .leading).combined(with: .opacity))
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)
                
                
                VStack(spacing: 15) {
                    
                    PrimaryButton(title: isOTPMode ? "Verify" : "Sign In") {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            if isOTPMode {
                                goToSetPasscode = true   // 👈 navigate here
                            } else {
                                isOTPMode = true
                            }
                        }
                    }
                    
                    if !isOTPMode {
                        HStack {
                            Text("Do not have an account?")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                            
                            Text("Sign Up")
                                .foregroundColor(.multipleGreen)
                                .bold()
                                .underline(true, color: .multipleGreen)
                        }
                        .font(.subheadline)
                        .transition(.opacity)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .ignoresSafeArea(edges: .bottom)
            .animation(.easeInOut(duration: 0.35), value: isOTPMode)
            
            // 👇 Navigation destination
            .navigationDestination(isPresented: $goToSetPasscode) {
                SetPasscodeView(onComplete: {})
            }
        }
    }
}




#Preview {
    SignInView(onComplete: {})
}

