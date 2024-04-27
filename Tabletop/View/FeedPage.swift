//
//  FeedPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/22/24.
//

import SwiftUI

struct FeedPage: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            Text("My Feed")
                .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                .foregroundColor(Color("ttPurple"))
            Spacer()
        }
        .padding()
        .background(Color("lightPurpleBG"))
        .ignoresSafeArea()
    }
}

#Preview {
    FeedPage()
}
