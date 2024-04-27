//
//  LocationDetailsView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @Binding var mapSelection: MKMapItem?
    @Binding var show: Bool
    
    @State private var lookAroundScene: MKLookAroundScene?
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(mapSelection?.placemark.name ?? "")
                        .font(Font.custom("ReadexPro-Regular_SemiBold", size: 30))
                        .foregroundColor(Color("ttBlack"))
                    
                    Text(mapSelection?.placemark.title ?? "")
                        .font(.custom("ReadexPro-Regular_Light", size: 14))
                        .foregroundColor(Color("lightGray"))
                }
                Spacer()
                
                Button {
                    show.toggle()
                    mapSelection = nil
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("ttGray"))
                }
            }
            
            if let scene = lookAroundScene {
                LookAroundPreview(initialScene: scene)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding()
            } else {
                ContentUnavailableView("No preview available", systemImage: "eye.slash")
            }
        }
        .onAppear {
            print("DEBUG: Did call on appear")
            fetchLookAroundPreview()
        }
        .onChange(of: mapSelection) { oldValue, newValue in
            print("DEBUG: Did call on change")
            fetchLookAroundPreview()
        }
        .padding()
    }
}

extension LocationDetailsView {
    func fetchLookAroundPreview() {
        if let mapSelection {
            lookAroundScene = nil
            Task {
                let request = MKLookAroundSceneRequest(mapItem: mapSelection)
                lookAroundScene = try? await request.scene
            }
        }
    }
}

#Preview {
    LocationDetailsView(mapSelection: .constant(nil), show: .constant(false))
}
