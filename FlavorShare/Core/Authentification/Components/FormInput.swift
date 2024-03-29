//
//  FormInput.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//


import SwiftUI
import iPhoneNumberField

enum InputType {
    case text
    case secure
    case date
    case phone
}

struct FormInput: View {
    var text: Binding<String> = .constant("")
    let placeholder: String
    let textContent: UITextContentType
    var errorMessage: Binding<String>
    
    var datafieldType: InputType = .text
    var dateSelection: Binding<Date> = .constant(Date())
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            
            // Input Field
            switch datafieldType {
            case .text:
                TextField(placeholder, text: text)
                    .padding(.horizontal, 10)
                    .foregroundStyle(Color("TextColor"))
                    .textContentType(textContent)
                    .padding(.top, 15)
                
            case .secure:
                SecureField(placeholder, text: text)
                    .textInputAutocapitalization(.never)
                    .textContentType(.newPassword)
                    .padding(.horizontal, 10)
                    .foregroundStyle(Color("TextColor"))
                    .padding(.top, 15)
                
            case .date:
                DatePicker (
                    "Date of Birth",
                    selection: dateSelection,
                    displayedComponents: [.date]
                )
                .textContentType(.birthdate)
                .padding(.horizontal, 10)
                .foregroundStyle(Color("TextColor"))
                .padding(.top, 15)
                
            case .phone:
                iPhoneNumberField(placeholder, text: text)
                    .flagHidden(false)
                    .flagSelectable(true)
                    .prefixHidden(false)
                    .maximumDigits(10)
                    .clearButtonMode(.whileEditing)
                    .padding(.horizontal, 10)
                    .foregroundStyle(Color("TextColor"))
                    .textContentType(textContent)
                    .padding(.top, 15)
            }
            
            
            // Decorator
            Rectangle()
                .fill(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 5)
            
            // Error Message/Handling
            Text(errorMessage.wrappedValue)
                .font(.system(size: 10))
                .foregroundStyle(.customRed)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    FormInput(text: .constant("Test"), placeholder: "Test", textContent: .namePrefix, errorMessage: .constant("Error Test"))
}
