//
//  LocationCaptionCell.swift
//  Tabletop
//
//  Created by Marina Lee on 5/1/24.
//

import SwiftUI

struct LocationCaptionCell: View {
    @EnvironmentObject var createPostViewModel: CreatePostViewModel

    @State private var isShowingMapView = false
    @State private var locationName = "Tap to add.."
    @State var captionTapped = false

    var body: some View {
        VStack {
            NavigationLink(destination: SearchMapView(), isActive: $isShowingMapView) {
                EmptyView()
            }
            .hidden()
            
            Button(action: {
                // Trigger location request
                LocationManager.shared.requestLocation()
                // Set the flag to true to show the map view
                isShowingMapView = true
            }) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("ttGreen"))
                        .frame(width: 30.0, height: 30.0)
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
                        .frame(width: 15.0, height: 15.0)
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
    }
}

#Preview {
    LocationCaptionCell()
        .environmentObject(CreatePostViewModel())
}
