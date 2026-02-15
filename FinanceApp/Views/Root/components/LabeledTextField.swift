//
//  LabelTextInputField.swift
//  FinanceApp
//
//  Created by Omidiora Emmanuel on 15/02/2026.
//

import Foundation


import SwiftUI

struct LabeledTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: UITextAutocapitalizationType = .sentences
    var disableAutocorrection: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .fontWeight(.medium)
                .font(.custom("Capriola-Regular", size: 16))
            
            ZStack(alignment: .leading) {
                TextField("", text: $text)
                    .keyboardType(keyboardType)
                    
                    .autocorrectionDisabled(disableAutocorrection) // iOS 15+ preferred API
                    .padding()
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color(.placeholderText))
                        .padding()
                        .allowsHitTesting(false)
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

