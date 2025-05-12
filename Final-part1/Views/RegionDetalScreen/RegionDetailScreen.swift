//
//  RegionDetailScreen.swift
//  Final-part1
//
//  Created by Emir Fatih AYYILDIZ on 22.01.2024.
//

import SwiftUI
import MapKit

struct RegionDetailScreen: View {
    let regionName: String
    @State private var locations: [Location] = []
    @State private var selectedLocation: Location? = nil

    var body: some View {
        VStack {
//            MapView(locations: locations, selectedLocation: $selectedLocation)
//                .frame(height: 300)
//                .onAppear {
//                    fetchData()
//                }

            if let selectedLocation = selectedLocation {
                LocationDetailsView(location: selectedLocation)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 5)
            }
        }
        .navigationTitle("Region Detail")
    }

    func fetchData() {
        guard let url = URL(string: "https://pinballmap.com/api/v1/region/\(regionName)/locations.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Location].self, from: data)
                    DispatchQueue.main.async {
                        self.locations = decodedData

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}

struct RegionDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegionDetailScreen(regionName: "SampleRegion")
    }
}

struct Location: Codable, Identifiable {
    let id: Int
    let name: String
    let address: String
    let numMachines: Int
    let latitude: Double
    let longitude: Double
}

//struct MapView: View {
//    var locations: [Location]
//    @Binding var selectedLocation: Location?
//
//    var body: some View {
//        Map(coordinateRegion: .constant(getCoordinateRegion()), showsUserLocation: false, userTrackingMode: .none, annotationItems: locations) { location in
//            MapPin(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), tint: .blue)
//                .onTapGesture {
//                    selectedLocation = location
//                }
//        }
//    }
//
//    private func getCoordinateRegion() -> MKCoordinateRegion {
//        guard let firstLocation = locations.first else {
//            return MKCoordinateRegion.default
//        }
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: firstLocation.latitude, longitude: firstLocation.longitude), span: span)
//
//        return region
//    }
//}

struct LocationDetailsView: View {
    let location: Location

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Location: \(location.name)")
                .font(.headline)
            Text("Address: \(location.address)")
                .font(.subheadline)
            Text("Machines: \(location.numMachines)")
                .font(.subheadline)
        }
    }
}
