//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI
import iPhoneNumberField

struct RegisterView: View {
    
    // MARK: VARIABLES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel = RegisterViewModel()
    @Binding var isSignupViewPresented: Bool
    
    private let screenSize: CGRect = UIScreen.main.bounds
    
    // MARK: BODY
    var body: some View {
        
        ZStack{
            // MARK: BACKGROUND
            Image("welcomeViewBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .blur(radius: 10.0)
            
            VStack (){
                // MARK: TITLE
                LogoTitle()
                
                ZStack{
                    // MARK: TILE
                    RoundedRectangle(cornerRadius: 40.0)
                        .fill(Color("TileColor"))
                        .frame(width: screenSize.width)
                        .ignoresSafeArea(.all)
                    
                    VStack(spacing: 10) {
                        // MARK: LOGIN SECTION
                        VStack (alignment: .center) {
                            Text("If you already have an account,")
                                .foregroundStyle(Color("TextColor"))
                                .fontWeight(.bold)
                            Button(action: {
                                isSignupViewPresented = false
                            }) {
                                Text("Login here!")
                                    .fontWeight(.bold)
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.customBlue, .customGreen]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            }
                        }
                        .padding(.top, 10)
                        
                        // MARK: REGISTER FORM
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                
                                // FIRST NAME
                                FormInput(text: $viewModel.firstName, placeholder: "First Name", textContent: .givenName, errorMessage: $viewModel.firstNameError)
                                    .onChange(of: viewModel.firstName) {
                                        viewModel.validateFirstName()
                                    }
                                
                                // LAST NAME
                                FormInput(text: $viewModel.lastName, placeholder: "Last Name", textContent: .familyName, errorMessage: $viewModel.lastNameError)
                                    .onChange(of: viewModel.lastName) {
                                        viewModel.validateLastName()
                                    }
                            }
                            
                            // EMAIL
                            FormInput(text: $viewModel.email, placeholder: "Email", textContent: .emailAddress, errorMessage: $viewModel.emailError)
                                .onChange(of: viewModel.email) {
                                    viewModel.validateEmail()
                                }
                            
                            // USERNAME
                            FormInput(text: $viewModel.username, placeholder: "Username", textContent: .username, errorMessage: $viewModel.usernameError)
                                .onChange(of: viewModel.username) {
                                    viewModel.validateUsername()
                                }
                            
                            // PHONE
                            FormInput(text: $viewModel.phone, placeholder: "Phone", textContent: .telephoneNumber, errorMessage: $viewModel.phoneError, datafieldType: .phone)
                                .onChange(of: viewModel.phone) {
                                    viewModel.validatePhone()
                                }
                            
                            // BIRTHDAY
                            FormInput(placeholder: "Date of Birth", textContent: .birthdate, errorMessage: $viewModel.dateOfBirthError, datafieldType: .date, dateSelection: $viewModel.dateOfBirth)
                                .onChange(of: viewModel.dateOfBirth) {
                                    viewModel.validateDateOfBirth()
                                }
                            
                            // PASSWORD
                            FormInput(text: $viewModel.password, placeholder: "Password", textContent: .newPassword, errorMessage: $viewModel.passwordError, datafieldType: .secure)
                                .onChange(of: viewModel.password) {
                                    viewModel.validatePassword()
                                }
                            
                            
                            // CONFIRM PASSWORD
                            FormInput(text: $viewModel.confirmpassword, placeholder: "Confirm Password", textContent: .newPassword, errorMessage: $viewModel.confirmpasswordError, datafieldType: .secure)
                                .onChange(of: viewModel.confirmpassword) {
                                    viewModel.validateConfirmPassword()
                                }
                        }
                        .frame(width: screenSize.width - 50)
                        
                        // MARK: REGISTER BUTTON
                        VStack {
                            Button {
                                Task {
                                    try await viewModel.createUser()
                                }
                            } label: {
                                Text("Register")
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, screenSize.width / 2 - 100)
                                    .padding(.vertical, 20)
                                    .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                                    .fontWeight(.bold)
                                    .cornerRadius(50)
                                    .shadow(radius: 3.0)
                            }
                            Text(viewModel.registerError)
                                .font(.system(size: 10))
                                .foregroundStyle(.customRed)
                                .padding(.horizontal, 10)
                        }
                        .padding(.top, 10)
                        PartnerSigninView()
                    }
                }
            }
            
            // MARK: LOADING SCREEN 
            if (viewModel.isLoading) {
                LoadingScreen()
            }
        } // ZStack
    } // Body
}

#Preview {
    RegisterView(isSignupViewPresented: .constant(false))
}
