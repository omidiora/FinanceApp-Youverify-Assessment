import SwiftUI

struct SetPasscodeView: View {
    let onComplete: () -> Void
    
    @State private var passcode = ""
    private let maxDigits = 4
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Welcome Back")
                    .font(.title2)
                    .bold()
                
                Text("Jane Doe")
                    .font(.title3)
            }
            
            // Passcode boxes
            HStack(spacing: 16) {
                ForEach(0..<maxDigits, id: \.self) { index in
                    Rectangle()
                        .fill(index < passcode.count ? Color.blue : Color.gray.opacity(0.3))
                        .frame(width: 55, height: 50)
                        
                }
            }
            .padding(.vertical)
            .padding(.horizontal,30)
            
            // Keypad
            VStack(spacing: 16) {
                // Row 1
                HStack(spacing: 16) {
                    keypadButton("1") { appendDigit("1") }
                    keypadButton("2") { appendDigit("2") }
                    keypadButton("3") { appendDigit("3") }
                }
                
                // Row 2
                HStack(spacing: 16) {
                    keypadButton("4") { appendDigit("4") }
                    keypadButton("5") { appendDigit("5") }
                    keypadButton("6") { appendDigit("6") }
                }
                
                // Row 3
                HStack(spacing: 16) {
                    keypadButton("7") { appendDigit("7") }
                    keypadButton("8") { appendDigit("8") }
                    keypadButton("9") { appendDigit("9") }
                }
                
                // Row 4
                HStack(spacing: 16) {
                    // Sign out button
                    Button("Sign out") {
                        // Handle sign out action
                    }
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(width: 80, height: 80)
                    .background(Color.clear)
                    
                    keypadButton("0") { appendDigit("0") }
                    
                    // Delete button
                    Button {
                        deleteDigit()
                    } label: {
                        Image(systemName: "delete.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .frame(width: 80, height: 80)
                    .background(Color(hex: "F5F5F6"))
                    .clipShape(Circle())
                }
            }
        }
        .padding()
    }
    
    private func appendDigit(_ digit: String) {
        guard passcode.count < maxDigits else { return }
        passcode += digit
        
        if passcode.count == maxDigits {
            // Validate passcode or complete
            onComplete()
        }
    }
    
    private func deleteDigit() {
        if !passcode.isEmpty {
            passcode.removeLast()
        }
    }
    
    private func keypadButton(_ title: String, action: @escaping () -> Void) -> some View {
        Button(title, action: action)
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 80, height: 80)
            .background(Color(hex: "F5F5F6"))
            .clipShape(Circle())
    }
}

// Color extension to support hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    SetPasscodeView(onComplete: {})
}
