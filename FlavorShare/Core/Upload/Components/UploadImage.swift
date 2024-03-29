//
//  UploadImage.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-29.
//

import SwiftUI

struct UploadImage: View {
    
    @Binding var image: Image?
    @Binding var imagePickerPresented: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.tile)
            
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
            }
            
            Button {
                imagePickerPresented.toggle()
            } label: {
                Text("\(image == nil ? "Add Image" : "")")
                    .foregroundStyle(.customBlue)
                    .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2.3)
                    .cornerRadius(25)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2.3)
        .cornerRadius(25)
        .shadow(radius: 3)
    }
}

#Preview {
    UploadImage(image: .constant(Image("")), imagePickerPresented: .constant(false))
}
