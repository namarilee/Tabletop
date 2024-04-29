//
//  SearchMapView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import MapKit

struct SearchMapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var createPostViewModel = CreatePostViewModel()

    @ObservedObject var locationManager = LocationManager.shared
    
    
    var body: some View {
        NavigationView {
            Map(position: $cameraPosition, selection: $mapSelection) {
                //UserAnnotation()
                
                Annotation("My Location", coordinate: .userLocation) {
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue.opacity(0.25))
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.blue)
                    }
                }
                
                ForEach(results, id: \.self) { item in
                    let placemark = item.placemark
                    Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                }
            }
            .overlay (alignment: .top) {
                TextField("Search for a restaurant, cafe, etc...", text: $searchText)
                    .font(Font.custom("ReadexPro-Regular_Light", size: 16))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .autocapitalization(.none)
            }
            .onSubmit(of: .text) {
                Task {
                    await searchPlaces()
                }
            }
            .onChange(of: mapSelection, { oldValue, newValue in
                showDetails = newValue != nil
                if let name = mapSelection?.placemark.name {
                    print(createPostViewModel.locationName)
                    createPostViewModel.locationName = name
                    print(createPostViewModel.locationName)

                }
            })
            .sheet(isPresented: $showDetails, content: {
                LocationDetailsView(mapSelection: $mapSelection, show: $showDetails)
                    .presentationDetents([.height(380)])
                    .presentationBackgroundInteraction(.enabled(upThrough: .height(380)))
                    .presentationCornerRadius(12)
            })
            .mapControls {
                MapCompass()
                MapPitchToggle()
                //MapUserLocationButton()
                
            }
        }
    }
}

extension SearchMapView {
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 25.7662, longitude: -80.1959)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
//#Preview {
//    SearchMapView(showDetails: true)
//}
