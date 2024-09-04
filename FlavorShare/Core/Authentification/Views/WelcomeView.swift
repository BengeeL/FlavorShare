//
//  ContentView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-26.
//

import SwiftUI

struct WelcomeView: View {
    // MARK: VARIABLES
    @State public var isLoginViewPresented = false
    @State public var isSignupViewPresented = false
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // MARK: BACKGROUND IMAGE
            // IMAGE
            Image("welcomeViewBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            // OVERLAY
            LinearGradient(
                gradient: .init(
                    colors: [.black.opacity(1), .clear]
                ),
                startPoint: .bottom,
                endPoint: .top)
            .ignoresSafeArea(.all)
            
            VStack(spacing: 20.0) {
                Spacer()
                // MARK: APP TITLE
                VStack(spacing: 0) {
                    Text("Welcome to")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    LogoTitle()
                }
                .padding(.horizontal, 100.0)
                
                // MARK: APP SUBTITLE
                Text("Helping you make cooking easy and enjoyable!")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 100.0)
                    .padding(.bottom, 20.0)
                
                // MARK: LOGIN/REGISTER
                HStack(spacing: 25) {
                    Button(action: {
                        self.isLoginViewPresented = true
                        self.isSignupViewPresented = false
                    }) {
                        Text("Login")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .padding(.vertical, 20)
                            .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(50)
                            .shadow(radius: 3.0)
                    }
                    .fullScreenCover(isPresented: $isLoginViewPresented, onDismiss: {
                        presentationMode.wrappedValue.dismiss()
                        isSignupViewPresented = true
                    }, content: {
                        LoginView(isLoginViewPresented: $isLoginViewPresented)
                    })
                    .padding(.bottom, 50)
                    
                    Button(action: {
                        self.isLoginViewPresented = false
                        self.isSignupViewPresented = true
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .padding(.vertical, 20)
                            .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(50)
                            .shadow(radius: 3.0)
                    }
                    .fullScreenCover(isPresented: $isSignupViewPresented, onDismiss: {
                        presentationMode.wrappedValue.dismiss()
                        isLoginViewPresented = true
                    }, content: {
                        RegisterView(isSignupViewPresented: $isSignupViewPresented)
                    })
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
