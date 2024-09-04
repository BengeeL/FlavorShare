//
//  SignupController.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation
import SwiftUI

@MainActor
class RegisterViewModel: ObservableObject {
    
    // MARK: VARIABLES
    // Text Fields
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var username = ""
    @Published var phone = ""
    @Published var dateOfBirth = Date.now
    @Published var password = ""
    @Published var confirmpassword = ""
    
    // Error Messages
    @Published var firstNameError = ""
    @Published var lastNameError = ""
    @Published var emailError = ""
    @Published var usernameError = ""
    @Published var phoneError = ""
    @Published var dateOfBirthError = ""
    @Published var passwordError = ""
    @Published var confirmpasswordError = ""
    @Published var registerError = ""
    
    // Overlay
    @Published var isLoading = false
    
    // MARK: REGISTRATION FUNCTIONS
    
    /// Register a new user to the platform.
    ///
    /// > Warning: The user will need to pass validation before being registered.
    ///
    func createUser() async throws {
        registerError = ""
        isLoading = true
        
        if (validateForm()) {
            do {
                try await AuthService.shared.createUser(
                    email: email,
                    password: password,
                    username: username,
                    firstName: firstName,
                    lastName: lastName,
                    phone: phone,
                    dateOfBirth: dateOfBirth
                )
                
                // Reset Values
                firstName = ""
                lastName = ""
                email = ""
                username = ""
                phone = ""
                dateOfBirth = Date.now
                password = ""
                confirmpassword = ""
                firstNameError = ""
                lastNameError = ""
                emailError = ""
                usernameError = ""
                phoneError = ""
                dateOfBirthError = ""
                passwordError = ""
                confirmpasswordError = ""
                registerError = ""
            } catch {
                registerError = "\(error.localizedDescription)"
            }
            
        } else {
            registerError = "Please fill all the fields!"
        }
        
        isLoading = false
    }
    
    
    
    // MARK: VALIDATION FUNCTIONS
    
    /// Validate the form is filled.
    ///
    /// - Returns: true if all input are completed
    ///
    func validateForm() -> Bool {
        validateFirstName()
        validateLastName()
        validateEmail()
        validateUsername()
        validatePhone()
        validateDateOfBirth()
        validatePassword()
        validateConfirmPassword()
        
        if (firstNameError.count > 0 || firstName.count == 0) {
            return false
        }
        if (lastNameError.count > 0 || lastName.count == 0) {
            return false
        }
        if (emailError.count > 0 || email.count == 0) {
            return false
        }
        if (usernameError.count > 0 || username.count == 0) {
            return false
        }
        if (phoneError.count > 0 || phone.count == 0) {
            return false
        }
        if (dateOfBirthError.count > 0 || dateOfBirth == Date.now) {
            return false
        }
        if (passwordError.count > 0 || password.count == 0) {
            return false
        }
        if (confirmpasswordError.count > 0 || confirmpassword.count == 0) {
            return false
        }
        
        return true
    }
    
    /// Validate the First Name
    ///
    func validateFirstName() {
        if (firstName.isEmpty) {
            firstNameError = "Required"
        } else if (firstName.count < 3) {
            firstNameError = "Please enter your first name"
        } else {
            firstNameError = ""
        }
    }
    
    /// Validate the Last Name
    ///
    func validateLastName() {
        if (lastName.isEmpty) {
            lastNameError = "Required"
        } else if (lastName.count < 3) {
            lastNameError = "Please enter your last name"
        } else {
            lastNameError = ""
        }
    }
    
    /// Validate the Email
    ///
    func validateEmail() {
        if (email.isEmpty) {
            emailError = "Required"
        } else if !isValidEmailFormat() {
            emailError = "Invalid email format"
        } else {
            emailError = ""
        }
    }
    
    /// Validate the email format
    ///
    /// - Returns: true if the email format is valid
    ///
    func isValidEmailFormat() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    /// Validate the Username
    ///
    func validateUsername() {
        if (username.isEmpty) {
            usernameError = "Required"
            // Looking for existing user with same username in controller validation.
            // Would make too many DB request if it was verified everytime a new character is entered.
        } else {
            usernameError = ""
        }
    }
    
    /// Validate the Phone Number
    ///
    func validatePhone() {
        if (phone.isEmpty) {
            phoneError = "Required"
        } else {
            phoneError = ""
        }
    }
    
    /// Validate the Date of Birth
    ///
    func validateDateOfBirth() {
        if (dateOfBirth == Date.now) {
            dateOfBirthError = "Required"
        } else {
            // Calculate age using Calendar
            let calendar = Calendar.current
            let today = Date()
            let components = calendar.dateComponents([.year], from: dateOfBirth, to: today)
            let age = components.year ?? 0
            
            if age < 16 {
                dateOfBirthError = "You must be at least 16 years old"
            } else {
                dateOfBirthError = ""
            }
        }
    }
    
    /// Validate the Password
    ///
    func validatePassword() {
        if (password.isEmpty || password == "") {
            passwordError = "Required"
        } else if (password.count < 8) {
            passwordError = "Password should be at least 8 characters"
        } else if (!validatePasswordFormat()) {
            passwordError = "Password must contain at least 1 uppercase, 1 lowercase, 1 number, and 1 special character"
        } else {
            passwordError = ""
        }
    }
    
    /// Validate the password format
    ///
    /// - Returns: true if the password format is valid
    ///
    func validatePasswordFormat() -> Bool {
        let regex = NSPredicate(format: "SELF MATCHES %@",
                                "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+-=])(?=\\S+$).{8,}$")
        return regex.evaluate(with: password)
    }
    
    /// Validate the Corfirm Password
    ///
    func validateConfirmPassword() {
        if (confirmpassword.isEmpty) {
            confirmpasswordError = "Required"
        } else if (confirmpassword != password) {
            confirmpasswordError = "Passwords don't match"
        } else {
            confirmpasswordError = ""
        }
    }
}
