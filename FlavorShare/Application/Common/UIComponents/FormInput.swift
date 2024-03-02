//
//  FormInput.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//


import SwiftUI

struct FormInput: View {
    let placeholder: String
    let text: Binding<String>
    
    var body: some View {
        VStack {
            textField
            GradientLine(primaryColor: .customBlue, secondaryColor: .customGreen)
        }
    }
    
    private var textField: some View {
        TextField(placeholder, text: text)
            .padding(.horizontal, 10)
            .foregroundColor(Color("TextColor"))
    }
}

private struct ContentView: View {
    @State var firstName: String = ""
    
    var body: some View {
        FormInput(placeholder: "TEST INPUT", text: $firstName)
    }
}

#Preview {
    ContentView()
}
