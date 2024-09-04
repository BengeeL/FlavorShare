//
//  PartnerSignin.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI

struct PartnerSigninView: View {
    // MARK: VARIABLES
    let screenSize: CGRect = UIScreen.main.bounds
    
    // MARK: BODY
    var body: some View {
        VStack {
            // MARK: OR CONTINUE WITH
            HStack{
                Rectangle()
                    .fill(Color("TextColor"))
                    .frame(width: screenSize.width/6, height: 1)
                    .ignoresSafeArea(.all)
                
                Text("or continue with")
                    .foregroundStyle(Color("TextColor"))
                    .font(.system(size: 15))
                
                Rectangle()
                    .fill(Color("TextColor"))
                    .frame(width: screenSize.width/6, height: 1)
                    .ignoresSafeArea(.all)
            }
            
            // MARK: LOGIN OPTIONS
            HStack(spacing: 20) {
                // MARK: APPLE
                Button(action: {
                    print("Apple Sign-In tapped")
                }) {
                    Image("appleIcon")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color("TextColor"))
                }
                
                // MARK: GOOGLE
                Button(action: {
                    print("Google Sign-In tapped")
                }) {
                    Image("googleIcon")
                        .resizable()
                        .frame(width: 47, height: 47)
                        .foregroundStyle(.customRed)
                }
                
                // MARK: META
                Button(action: {
                    print("Facebook Sign-In tapped")
                }) {
                    Image("facebookIcon")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    PartnerSigninView()
}
