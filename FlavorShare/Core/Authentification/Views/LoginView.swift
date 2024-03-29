//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var isLoginViewPresented: Bool
    @StateObject var viewModel = LoginViewModel()

    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            background
            contentOverlay
            
            if (viewModel.isLoading) {
                LoadingScreen()
            }
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
            PartnerSigninView()
        }
    }
    
    private var loginSection: some View {
        LogoTitle()
            .padding(.vertical, 50)
    }
    
    private var inputFields: some View {
        VStack(spacing: 5) {
            FormInput(text: $viewModel.email, placeholder: "Email", textContent: .emailAddress, errorMessage: .constant(""))
            
            FormInput(text: $viewModel.password, placeholder: "Password", textContent: .password, errorMessage: .constant(""), datafieldType: .secure)
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
        VStack {
            Button {
                Task {
                    try await viewModel.signIn()
                }
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .padding(.horizontal, UIScreen.main.bounds.width / 2 - 100)
                    .padding(.vertical, 20)
                    .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                    .fontWeight(.bold)
                    .cornerRadius(50)
                    .shadow(radius: 3.0)
            }
            Text(viewModel.loginError)
                .font(.system(size: 10))
                .foregroundStyle(.customRed)
                .padding(.horizontal, 10)
        }
    }
    
    private var registerSection: some View {
        HStack{
            Text("Don't have an account?")
                .foregroundStyle(Color("TextColor"))
            
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

#Preview {
    LoginView(isLoginViewPresented: .constant(false))
}
