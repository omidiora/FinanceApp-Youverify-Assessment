import SwiftUI

struct VerificationView: View {
    let onComplete: () -> Void
    
    @State private var code = ""
    
    var body: some View {
        ZStack {
            // Main content
            VStack(alignment: .leading, spacing: 20) {
                Text("Check your email!")
                 .font(.custom("Capriola-Regular", size: 30))
                
                Text("We have sent an email to janedoe@gmail.com. Please remember to check your inbox as well as the spam folder.")
                    .font(.AppFont(20))
                    .foregroundColor(.black)
                     .tint(.black)
                   
                
                
                Text("Please enter the verification code below to continue with your account.")
                    .font(.AppFont(20))
                
                LabeledTextField(
                    label: "Enter verification code",
                    placeholder: "Enter code here",
                    text: $code,
                    autocapitalization: .none
                )
                
                Spacer() // pushes everything up
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            
            // Bottom button
            VStack(spacing: 15) {
                PrimaryButton(title: "Create an account") {
                    onComplete()
                }
                
                HStack {
                    Text("Didn’t receive the email?")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    
                    Text("Resend code")
                        .foregroundColor(.multipleGreen)
                        .bold()
                        .underline(true, color: .multipleGreen)
                        .onTapGesture {
                            // Resend code action
                        }
                }
                .font(.subheadline)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .frame(maxHeight: .infinity, alignment: .bottom) // pins to bottom
        }
        .ignoresSafeArea(edges: .bottom) // optional, only if background needs full screen
    }
}


#Preview {
    VerificationView(onComplete: {})
}

