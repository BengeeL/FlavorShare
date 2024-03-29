//
//  Profile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-08.
//

import SwiftUI

struct SettingView: View {
//    let session = Session()
    var body: some View {
        List {
            Section {
                
//                if ((session.user.getProfilePic() == nil)) {
//                    Text("\(session.user.getFirstName().capitalized.first)\(session.user.getFirstName().uppercased().last)")
//                } else {
//                    let url = URL(string: session.user.getProfilePic()!)
//                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//                    Image(data: data!)
//                }
            }
            
            Section("General") {
                
            }
            
            Section("Account") {
                
            }
        }
    }
}

#Preview {
    SettingView()
}
