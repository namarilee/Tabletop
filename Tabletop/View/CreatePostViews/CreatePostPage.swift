//
//  CreatePostPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/26/24.
//

import SwiftUI
import PhotosUI

struct CreatePostPage: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var feedViewModel: FeedViewModel
    @EnvironmentObject var createPostViewModel: CreatePostViewModel
    @EnvironmentObject var todayMealViewModel: TodayMealViewModel
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var mealImage: UIImage?
    @State private var showImagePicker = false
    @State private var showImageOptions = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var isPostShared: Bool
    
    private let ratingCaptions = ["Bad 😭", "Okay 😐", "Good 🙂", "Great 😄", "Awesome! 😍"]
    
    var body: some View {
        ScrollView {
            Text("Create Post")
                .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                .foregroundColor(Color("ttPurple"))
            VStack {
                Button(action: {
                    showImagePicker = true
                }) {
                    if let mealImage = mealImage {
                        Image(uiImage: mealImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(20)
                            .frame(width: 180, height: 220)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    } else {
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
                    }
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerView(sourceType: sourceType, didSelectImage: { image in
                        Task {
                            createPostViewModel.isImageSelected = true
                            mealImage = image
                            createPostViewModel.uiImage = image
                            photosPickerItem = nil
                        }
                    })
                }
                
                Spacer()
                    .frame(height: 35)
                
                
                Text("How would you rate your meal?")
                    .font(.custom("ReadexPro-Regular_Medium", size: 20))
                    .foregroundColor(Color("ttBlack"))
                
                Spacer()
                    .frame(height: 10)
                
                Text(createPostViewModel.rating != nil ? "\(self.ratingCaptions[createPostViewModel.rating!])" : "")
                    .font(.custom("ReadexPro-Regular", size: 16))
                    .foregroundColor(Color("ttGray"))
                
                HStack (spacing: 12) {
                    ForEach(0...4, id: \.self) { index in
                        Image(systemName: createPostViewModel.starType(index: index))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("ttRed"))
                            .frame(width: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                createPostViewModel.rating = index
                                print("rating: \(createPostViewModel.rating ?? 46)")
                                createPostViewModel.ratingSelected = true
                            }
                    }
                }
                
                Spacer()
                    .frame(height: 40)
                
                VStack {
                    LocationCaptionCell()
                    
                    Spacer()
                        .frame(height: 25)
                    
                    Button("Share") {
                        Task {
                            do {
                                try await createPostViewModel.uploadPost(caption: createPostViewModel.caption)
                            } catch {
                                print("Error uploading post: \(error)")
                            }
                            // Fetch posts to get the image that was just posted
                            try await feedViewModel.fetchPosts()
                            todayMealViewModel.isPostShared = true
                        }
                        dismiss()
                    }
                    .disabled(!createPostViewModel.isUserAllowedToPost())
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 24))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40.0)
                    .background(createPostViewModel.isUserAllowedToPost() ? Color("ttRed") : Color("ttRedLighter"))
                    .cornerRadius(14.0)
                }
                .padding()
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .background(Color("lightPurpleBG"))
    }
}

#Preview {
    CreatePostPage(isPostShared: .constant(false))
        .environmentObject(UserViewModel())
        .environmentObject(FeedViewModel())
        .environmentObject(TodayMealViewModel())
        .environmentObject(CreatePostViewModel())
}


