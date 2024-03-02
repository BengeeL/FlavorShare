//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""

    @Binding var isLoginViewPresented: Bool
    
    // Define your colors
    let green = Color(hex: "53E791")
    let blue = Color(hex: "328FFF")
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            background
            contentOverlay
        }
    }
    
    private var contentOverlay: some View {
        VStack {
            form
        }
        .padding(.top, 40)
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
        VStack {
            loginSection
            inputFields
            loginButton
                .padding(.top, 40)
            registerSection
                .padding(.bottom, 60)
            PartnerSignin()
        }
    }
    
    private var loginSection: some View {
        LogoTitle()
            .padding(.vertical, 50)
    }
    
    private var inputFields: some View {
        VStack(spacing: 10) {
            FormInput(placeholder: "Email", text: $email)
            
            SecureField("Password", text: $password)
                .padding(.horizontal, 10)
                .foregroundColor(Color("TextColor"))
            gradiantLine
        }
        .frame(width: screenSize.width - 50)
    }
    
    private var gradiantLine: some View {
        Rectangle()
            .fill(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
            .frame(height: 5)
            .padding(.bottom, 10)
    }
    
    private var loginButton: some View {
        Button {
            print("Login button tapped")
        } label: {
            Text("Login")
                .foregroundColor(.white)
                .padding(.horizontal, UIScreen.main.bounds.width / 2 - 100)
                .padding(.vertical, 20)
                .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                .fontWeight(.bold)
                .cornerRadius(50)
                .shadow(radius: 3.0)
        }
    }
    
    private var registerSection: some View {
        HStack{
            Text("Don't have an account?")
                .foregroundColor(Color("TextColor"))
            
            Button {
                isLoginViewPresented = false
            } label: {
                Text("Register Here!")
                    .fontWeight(.bold)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .green]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
        }
        .padding(.top, 10)
    }

    private var background: some View {
        Image("welcomeViewBackground")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
            .blur(radius: 10.0)
    }
}

private struct ContentView: View {
    @State public var isLoginViewPresented = false
    
    var body: some View {
        LoginView(isLoginViewPresented: $isLoginViewPresented)
    }
}

#Preview {
    ContentView()
}
