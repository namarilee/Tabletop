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
    @StateObject var manager = TFManager()
    @State var captionTapped = false
    
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
                Text("Create Post")
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                    .foregroundColor(Color("ttPurple"))
                VStack {
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
                    
                   Spacer()
                        .frame(height: 35)
                    
                    
                    Text("How would you rate your meal?")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                    
                    Spacer()
                         .frame(height: 10)
                    
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
                    
                    Spacer()
                         .frame(height: 40)
                    
                    Text("Optional – feel free to come back and edit later!")
                        .font(Font.custom("ReadexPro-Regular", size: 12))
                        .foregroundColor(Color("lightGray"))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack {
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("ttGreen"))
                                .frame(width: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/, height: 30.0)
                            VStack (alignment: .leading) {
                                Text("Location:")
                                    .font(Font.custom("ReadexPro-Regular_SemiBold", size: 16))
                                    .foregroundColor(Color("ttBlack"))
                                Text("Tap to add...")
                                    .font(Font.custom("ReadexPro-Regular_SemiBold", size: 16))
                                    .foregroundColor(Color("lightGray"))
                            }
                            Spacer()
                            Image(systemName: "greaterthan")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15.0, height: /*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                                
                        }
                        .padding(.vertical, 10.0)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(16)

                        Spacer()
                            .frame(height: 25)
                        
                        Text("Caption:")
                            .font(Font.custom("ReadexPro-Regular_SemiBold", size: 16))
                            .foregroundColor(Color("ttBlack"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Add a description...", text: $manager.caption, axis: .vertical)
                            .font(.custom("ReadexPro-Regular_Light", size: 14))

                        
                        Rectangle()
                            .fill(captionTapped ? Color("ttGray") : Color("lightGray"))
                            .frame(height: 1)
                        
                        HStack {
                            Spacer()
                            Text("\(manager.caption.count)/1000")
                                .font(.custom("ReadexPro-Regular", size: 10))
                                .foregroundColor(Color("lightGray"))
                        }
                    }
                    .padding()
                    .background(Color(red: 235.0 / 255.0, green: 235.0 / 255.0, blue: 255.0 / 255.0))
                    .cornerRadius(20)
                    
                    Spacer()
                        .frame(height: 25)
                    
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
                .padding()
            }
            .background(Color("lightPurpleBG"))

        }
    }
}

#Preview {
    CreatePostPage()
        .environmentObject(UserViewModel())
}

class TFManager: ObservableObject {
    @Published var caption = "" {
        didSet {
            if caption.count >= 1000 && oldValue.count <= 1000 {
                caption = oldValue
            }
        }
    }
}
