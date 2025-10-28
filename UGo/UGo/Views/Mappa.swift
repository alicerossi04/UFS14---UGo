//
//  Mappa.swift
//  UGo
//
//  Created by s11 on 28/10/25.
//

import SwiftUI
import MapKit

struct MappaItinerarioView: View {
    let itinerario: Itinerario
    
    private var startCoordinate: CLLocationCoordinate2D? {
        if let lat = Double(itinerario.Coordinate_S_lat),
           let lon = Double(itinerario.Coordinate_S_lon) {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        return nil
    }
    
    private var endCoordinate: CLLocationCoordinate2D? {
        if let lat = Double(itinerario.Coordinate_E_lat),
           let lon = Double(itinerario.Coordinate_E_lon) {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        return nil
    }
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: puntiValidi) { punto in
            MapMarker(coordinate: punto.coordinate)
        }
        .onAppear { aggiornaRegione() }
    }
    
    private var puntiValidi: [Punto] {
        var punti: [Punto] = []
        if let start = startCoordinate {
            punti.append(Punto(id: 1, coordinate: start))
        }
        if let end = endCoordinate {
            punti.append(Punto(id: 2, coordinate: end))
        }
        return punti
    }
    
    private func aggiornaRegione() {
        guard let start = startCoordinate, let end = endCoordinate else { return }
        let midLat = (start.latitude + end.latitude) / 2
        let midLon = (start.longitude + end.longitude) / 2
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: midLat, longitude: midLon),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct Punto: Identifiable {
    let id: Int
    let coordinate: CLLocationCoordinate2D
}
