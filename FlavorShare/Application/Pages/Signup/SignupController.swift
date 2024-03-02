//
//  SignupController.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation

struct SignupController {

    let firstName: String
    let lastName: String
    let email: String
    let username: String
    let phone: String
    let dateOfBirth: Date
    let password: String
    let confirmpassword: String

    func handleRegistration() {
        // 1. Validate user input
        if validateForm() {
          // 2. Collect registration data
          let newUser = User(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone, 
            username: username,
            dateOfBirth: dateOfBirth,
            password: password,
            confirmPassword: confirmpassword
          )

//          // 3. Perform registration (e.g., call a web service or API)
//          RegistrationService.shared.registerUser(registrationData) { success in
//            if success {
//              // 4. Dismiss SignupView on successful registration
//              isSignupViewPresented = false
//              // 5. Handle successful registration (e.g., display success message or navigate to a different view)
//            } else {
//              // 6. Handle registration failure (e.g., display an error message)
//            }
//          }
        }
      }

      private func validateForm() -> Bool {
        // Perform validation checks on user input (e.g., check for empty fields, valid email format, matching passwords, etc.)
        // Return true if validation passes, false otherwise
          return true
      }
}
