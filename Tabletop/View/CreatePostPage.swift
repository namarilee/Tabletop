//
//  CreatePostPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/26/24.
//

import SwiftUI

struct CreatePostPage: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userViewModel: UserViewModel

    @State private var rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    private let ratingCaptions = ["Bad 😭", "Okay 😐", "Good 🙂", "Great 😄", "Awesome! 😍"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                
                VStack (spacing: 25){
                    Text("Create Post")
                        .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                        .foregroundColor(Color("ttPurple"))
                    
                    
                    VStack (spacing: 18) {
                        Image(systemName: "camera.on.rectangle.fill")
                            .resizable(resizingMode: .tile)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .rotationEffect(Angle(degrees: -15))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color("ttPurple"), Color("ttGreen"))
                        
                        Text("Add image")
                            .font(.custom("ReadexPro-Regular_Medium", size: 20))
                            .foregroundColor(Color("lightGray"))
                    }
                    .padding(40)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                   
                    
                    
                    Text("How would you rate your meal?")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                    
                    Text(rating != nil ? "\(self.ratingCaptions[rating!])" : "")
                        .font(.custom("ReadexPro-Regular", size: 16))
                        .foregroundColor(Color("ttGray"))
                    
                    HStack (spacing: 12){
                        ForEach(0...4, id: \.self) { index in
                            Image(systemName: self.starType(index: index))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color("ttRed"))
                                .frame(width: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                                .onTapGesture {
                                    self.rating = index
                                }
                        }
                    }
                    
                    

                    Button("Share") {
                        dismiss()
                    }
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 24))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40.0)
                    .background(Color("ttRed"))
                    .cornerRadius(14.0)
                }
                
            }
            .padding(40)
            .background(Color("lightPurpleBG"))

        }
    }
}

#Preview {
    CreatePostPage()
        .environmentObject(UserViewModel())
}
