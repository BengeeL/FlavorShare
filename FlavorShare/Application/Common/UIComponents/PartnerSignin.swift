//
//  PartnerSignin.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-28.
//

import SwiftUI

struct PartnerSignin: View {

    let screenSize: CGRect = UIScreen.main.bounds

    var body: some View {
        VStack {
            connectWith
            socialLoginButtons
        }
    }
    
    private var connectWith: some View {
        HStack{
            Rectangle()
                .fill(Color("TextColor"))
                .frame(width: screenSize.width/6, height: 1)
                .ignoresSafeArea(.all)
            
            Text("or continue with")
                .foregroundColor(Color("TextColor"))
                .font(.system(size: 15))
            
            Rectangle()
                .fill(Color("TextColor"))
                .frame(width: screenSize.width/6, height: 1)
                .ignoresSafeArea(.all)
        }
    }
    
    private var socialLoginButtons: some View {
        HStack(spacing: 20) {
            Button(action: {
                print("Apple Sign-In tapped")
            }) {
                Image("appleIcon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("TextColor"))
            }
            
            Button(action: {
                print("Google Sign-In tapped")
            }) {
                Image("googleIcon")
                    .resizable()
                    .frame(width: 47, height: 47)
                    .foregroundColor(.customRed)
            }
            
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

#Preview {
    PartnerSignin()
}
