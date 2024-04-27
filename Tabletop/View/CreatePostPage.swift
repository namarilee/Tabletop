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

    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Spacer()
                    Button("Share") {
                        dismiss()
                    }
//                    NavigationLink(destination: TodayMealPage()) {
//                        VStack {
//                            Text("Share")
//                                .font(.custom("ReadexPro-Regular_Medium", size: 22))
//                                .foregroundColor(Color.white)
//                                .multilineTextAlignment(.center)
//                        }
//                        .padding(10)
//                        .background(Color("ttRed"))
//                    }
//                    .cornerRadius(14.0)
                }
                .padding()

                Text("Create Post")
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                    .foregroundColor(Color("ttPurple"))
            }
            .background(Color("lightPurpleBG"))

        }
        //.background(Color("lightPurpleBG"))
    }
}

#Preview {
    CreatePostPage()
        .environmentObject(UserViewModel())
}
