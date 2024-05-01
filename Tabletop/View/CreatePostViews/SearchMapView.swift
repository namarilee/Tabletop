//
//  SearchMapView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import MapKit

struct SearchMapView: View {
    static var userRegion: MKCoordinateRegion {
            guard let location = LocationManager.shared.userLocation else {
                return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0250684, longitude: -118.2825343), latitudinalMeters: 10000, longitudinalMeters: 10000)
            }
            return MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
    
    @State private var cameraPosition: MapCameraPosition = .region(userRegion)
    
    
    
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var createPostViewModel: CreatePostViewModel
    
    @ObservedObject var locationManager = LocationManager.shared
    
    
    var body: some View {
        NavigationView {
            Map(position: $cameraPosition, selection: $mapSelection) {
                //UserAnnotation()
                if let location = locationManager.userLocation {
                    Annotation("My Location", coordinate: location.coordinate) {
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
                    if let userLocation = locationManager.userLocation {
                        await searchPlaces(near: userLocation.coordinate)
                    }
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
            }
        }
        .onAppear {
            guard let location = locationManager.userLocation else { return }
            cameraPosition = .region(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000))
        }
    }
}

extension SearchMapView {

    func searchPlaces(near userLocation: CLLocationCoordinate2D) async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
}
