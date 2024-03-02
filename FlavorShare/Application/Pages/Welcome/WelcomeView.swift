//
//  ContentView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-26.
//

import SwiftUI

struct WelcomeView: View {
    
    @State public var isLoginViewPresented = false
    @State public var isSignupViewPresented = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            backgoundIMG
            shadowOverlay
            VStack(spacing: 20.0) {
                Spacer()
                appTitle
                appSubtittle
                loginRegister
            }
        }
    }
    
    private var backgoundIMG: some View {
        Image("welcomeViewBackground")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
    
    private var shadowOverlay: some View {
        LinearGradient(
            gradient: .init(
                colors: [.black.opacity(1), .clear]
            ),
            startPoint: .bottom,
            endPoint: .top)
//        .frame(width: .infinity, height: .infinity)
        .ignoresSafeArea(.all)
    }
    
    private var appTitle: some View {
        VStack(spacing: 0) {
            Text("Welcome to")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            LogoTitle()
        }
        .padding(.horizontal, 100.0)
    }
    
    private var appSubtittle: some View {
        Text("Helping you make cooking easy and enjoyable!")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 100.0)
            .padding(.bottom, 20.0)
    }
    
    private var loginRegister: some View {
        HStack(spacing: 25) {
            Button(action: {
                self.isLoginViewPresented = true
                self.isSignupViewPresented = false
            }) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 120)
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
                    .foregroundColor(.white)
                    .frame(width: 120)
                    .padding(.vertical, 20)
                    .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(50)
                    .shadow(radius: 3.0)
            }
            .fullScreenCover(isPresented: $isSignupViewPresented, onDismiss: {
                presentationMode.wrappedValue.dismiss()
                isLoginViewPresented = true
            }, content: {
                SignupView(isSignupViewPresented: $isSignupViewPresented)
            })
            .padding(.bottom, 50)
        }
    }
    
}

#Preview {
    WelcomeView()
}
