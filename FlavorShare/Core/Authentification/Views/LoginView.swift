//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: VARIABLE
    @Environment(\.dismiss) var dismiss
    @Binding var isLoginViewPresented: Bool
    @FocusState private var isPasswordFocused: Bool
    @StateObject var viewModel = LoginViewModel()

    let screenSize: CGRect = UIScreen.main.bounds
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // MARK: BACKGROUND
            Image("welcomeViewBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .blur(radius: 10.0)
            
            // MARK: CONTENT
            ZStack{
                RoundedRectangle(cornerRadius: 40.0)
                    .fill(Color("TileColor"))
                    .frame(width: screenSize.width)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Logo
                    LogoTitle()
                        .padding(.bottom, 50)
                    
                    // MARK: LOGIN INFO
                    VStack(spacing: 5) {
                        FormInput(text: $viewModel.email, placeholder: "Email", textContent: .emailAddress, errorMessage: .constant(""))
                            .keyboardType(.emailAddress)
                            .submitLabel(.next)
                            .onSubmit {
                                isPasswordFocused = true
                            }
                        
                        FormInput(text: $viewModel.password, placeholder: "Password", textContent: .password, errorMessage: .constant(""), datafieldType: .secure)
                            .keyboardType(.default)
                            .focused($isPasswordFocused)
                            .submitLabel(.go)
                            .onSubmit {
                                Task {
                                    try await viewModel.signIn()
                                }
                            }
                        
                        // ERROR MESSAGE
                        Text(viewModel.loginError)
                            .font(.caption)
                            .foregroundStyle(.customRed)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                    }
                    .frame(width: screenSize.width - 50)
                    
                    // MARK: LOGIN BUTTON
                    VStack (spacing: 15) {
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
                    }
                    .padding(.top, 40)
                    
                    // MARK: REGISTER SECTION
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
                    
                    Spacer()
                    
                    PartnerSigninView()
                        .padding(.bottom, 60)
                }
            }
            .padding(.top, 40)
            
            // MARK: LOADING VIEW
            if (viewModel.isLoading) {
                LoadingScreen()
            }
        }
    }
    
    private var gradiantLine: some View {
        Rectangle()
            .fill(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
            .frame(height: 5)
            .padding(.bottom, 10)
    }
}

#Preview {
    LoginView(isLoginViewPresented: .constant(false))
}
