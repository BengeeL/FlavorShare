//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI

struct SignupView: View {
    
    @State private var isLoginViewPresented = false
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var phone: String = ""
    @State private var dateOfBirth: Date = Date.now
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    
    @Binding var isSignupViewPresented: Bool
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack{
            background
            contentOverlay
        }
    }
    
    private var background: some View {
        Image("welcomeViewBackground")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
            .blur(radius: 10.0)
    }
    
    private var contentOverlay: some View {
        VStack {
            LogoTitle()
            form
        }
    }
    
    private var form: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40.0)
                .fill(Color("TileColor"))
                .frame(width: screenSize.width)
                .ignoresSafeArea(.all)
            loginInfo
        }
    }
    
    private var loginInfo: some View {
        VStack(spacing: 20.0) {
            loginSection
            inputFields
            registerButton
                .padding(.top, 10)
            PartnerSignin()
        }
    }
    
    private var loginSection: some View {
        VStack {
            Text("If you already have an account,")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color("TextColor"))
                .fontWeight(.bold)
            Button(action: {
                isSignupViewPresented = false
            }) {
                Text("Login here!")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [.customBlue, .customGreen]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.top, 10)
    }
    
    private var inputFields: some View {
        VStack(spacing: 10) {
            HStack {
                FormInput(placeholder: "First Name", text: $firstName)
                
                FormInput(placeholder: "Last Name", text: $lastName)
            }
            FormInput(placeholder: "Email", text: $email)
            
            FormInput(placeholder: "Username", text: $username)
            
            FormInput(placeholder: "Phone Number", text: $phone)
            
            DatePicker (
                "Date of Birth",
                selection: $dateOfBirth,
                displayedComponents: [.date]
            )
            .padding(.horizontal, 10)
            .foregroundColor(Color("TextColor"))
            GradientLine(primaryColor: .customBlue, secondaryColor: .customGreen)
            
            FormInput(placeholder: "Email", text: $email)
            
            SecureField("Password", text: $password)
                .padding(.horizontal, 10)
                .foregroundColor(Color("TextColor"))
            GradientLine(primaryColor: .customBlue, secondaryColor: .customGreen)
            
            SecureField("Confirm Password", text: $confirmpassword)
                .padding(.horizontal, 10)
                .foregroundColor(Color("TextColor"))
            GradientLine(primaryColor: .customBlue, secondaryColor: .customGreen)
            
        }
        .frame(width: screenSize.width - 50)
    }
    
    private var registerButton: some View {
        Button {
            let controller = SignupController(
                firstName: firstName,
                lastName: lastName,
                email: email,
                username: username,
                phone: phone,
                dateOfBirth: dateOfBirth,
                password: password,
                confirmpassword: confirmpassword
                
            )
            controller.handleRegistration()
        } label: {
            Text("Register")
                .foregroundColor(.white)
                .padding(.horizontal, screenSize.width / 2 - 100)
                .padding(.vertical, 20)
                .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                .fontWeight(.bold)
                .cornerRadius(50)
                .shadow(radius: 3.0)
        }
    }
}



private struct ContentView: View {
    @State public var isSignupViewPresented = false
    
    var body: some View {
        SignupView(isSignupViewPresented: $isSignupViewPresented)
    }
}

#Preview {
    ContentView()
}
