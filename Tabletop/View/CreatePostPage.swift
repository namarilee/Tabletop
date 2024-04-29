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
    
    @StateObject var createPostViewModel = CreatePostViewModel()
    @State var captionTapped = false
    
    @StateObject var todayMealViewModel = TodayMealViewModel()
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var mealImage: UIImage?
    
    @State private var showImagePicker = false
    @State private var showImageOptions = false

    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    @State private var locationName = "Tap to add.."
    
    
    private let ratingCaptions = ["Bad 😭", "Okay 😐", "Good 🙂", "Great 😄", "Awesome! 😍"]
    
    var body: some View {
        // NavigationView {
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
//                            if let photosPickerItem,
//                               let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
//                                if let image = UIImage(data: data) {
//                                    print(createPostViewModel.imageSelected)
//
//                                    createPostViewModel.imageSelected = true
//                                    print(createPostViewModel.imageSelected)
                                    mealImage = image
                                //}
                            
                            photosPickerItem = nil
                        }
                    })
                }
             
//
//                .actionSheet(isPresented: $showImageOptions) {
//                    ActionSheet(title: Text("Add Image"), buttons: [
//                        .default(Text("Choose Photo"), action: {
//                            // Handle choosing photo
//                            sourceType = .photoLibrary
//                            showImagePicker = true
//                            // show ImagePickerView sheet
//                        }),
//                        .default(Text("Take Photo"), action: {
//                            // Handle taking photo
//                            sourceType = .camera
//                        }),
//                        .cancel()
//                    ])
//                }
                
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
                                createPostViewModel.ratingSelected = true
                            }
                    }
                }
                
                Spacer()
                    .frame(height: 40)
                
                //                    Text("Optional – feel free to come back and edit later!")
                //                        .font(Font.custom("ReadexPro-Regular", size: 12))
                //                        .foregroundColor(Color("lightGray"))
                
                VStack {
                    NavigationLink(destination: SearchMapView()) {
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("ttGreen"))
                                .frame(width: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/, height: 30.0)
                            VStack (alignment: .leading) {
                                Text("Location")
                                    .font(Font.custom("ReadexPro-Regular_SemiBold", size: 16))
                                    .foregroundColor(Color("ttBlack"))
                                Text(createPostViewModel.locationName)
                                    .font(Font.custom("ReadexPro-Regular", size: 16))
                                    .foregroundColor(Color("lightGray"))
                            }
                            Spacer()
                            Image(systemName: "greaterthan")
                                .resizable()
                                .foregroundColor(Color("ttPurple"))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15.0, height: /*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                            
                        }
                        .padding(.vertical, 10.0)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(16.0)
                    }
                    
                    Spacer()
                        .frame(height: 25)
                    
                    Text("Caption")
                        .font(Font.custom("ReadexPro-Regular_SemiBold", size: 16))
                        .foregroundColor(Color("ttBlack"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Add a description...", text: $createPostViewModel.caption, axis: .vertical)
                        .font(.custom("ReadexPro-Regular_Light", size: 14))
                    
                    
                    Rectangle()
                        .fill(captionTapped ? Color("ttPurple") : Color("lightGray"))
                        .frame(height: 1)
                    
                    HStack {
                        Spacer()
                        Text("\(createPostViewModel.caption.count)/1000")
                            .font(.custom("ReadexPro-Regular", size: 10))
                            .foregroundColor(Color("lightGray"))
                    }
                }
                .padding()
                .background(Color("ttPurpleLighter"))
                .cornerRadius(20.0)
                
                Spacer()
                    .frame(height: 25)
                
                Button("Share") {
                    Task {
                        try await createPostViewModel.uploadPost(caption: createPostViewModel.caption)
                    }
                    dismiss()
                    todayMealViewModel.sharePost()
                    print("isPostShared: \(todayMealViewModel.isPostShared)") // Access the boolean variable directly
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
//            .onChange(of: photosPickerItem) { _, _ in
//                                Task {
//                                    if let photosPickerItem,
//                                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
//                                        if let image = UIImage(data: data) {
//                                            createPostViewModel.imageSelected = true
//                                            mealImage = image
//                                        }
//                                    }
//                                    photosPickerItem = nil
//            
//                                }
//                            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .background(Color("lightPurpleBG"))
        
    }
    //}
}

#Preview {
    CreatePostPage()
        .environmentObject(UserViewModel())
}


