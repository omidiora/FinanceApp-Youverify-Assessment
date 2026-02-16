import SwiftUI

struct SignUpView: View {
    
    let onContinue: () -> Void
    let onLoginTap: () -> Void
    
    @State private var fullName = ""
    @State private var email = ""
    @State private var referralCode = ""
    
    var body: some View {
        VStack {
            // MARK: Content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Let’s get started! 🎉")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Join us and start managing your finances with Fintrack today.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 10)
                    
                    // Fields
                    LabeledTextField(
                        label: "First & Last Name",
                        placeholder: "e.g John Doe",
                        text: $fullName,
                        autocapitalization: .words
                    )
                    
                    LabeledTextField(
                        label: "Email address",
                        placeholder: "e.g email@mail.com",
                        text: $email,
                        keyboardType: .emailAddress,
                        autocapitalization: .none,
                        disableAutocorrection: true
                    )
                    
                    LabeledTextField(
                        label: "Enter a referral code (optional)",
                        placeholder: "e.g ABC123",
                        text: $referralCode
                    )
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
            }
            
            // MARK: Bottom Section
            VStack(spacing: 16) {
                PrimaryButton(title: "Create an account") {
                    onContinue()
                }
//             
                
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .foregroundColor(.secondary)
                    
                    Text("Sign In")
                        .foregroundColor(.teal)
                        .underline()
                        .onTapGesture {
                            onLoginTap()
                        }
                }
                .font(.subheadline)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
            .background(Color.white)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    SignUpView(onContinue: {}, onLoginTap: {})
}
