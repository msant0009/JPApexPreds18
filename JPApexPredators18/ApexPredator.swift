//
//  ApexPredator.swift
//  JPApexPredators18
//
//  Created by Mark Santoro on 1/1/25.
//
import MapKit
import SwiftUI

enum APType: String, Decodable, CaseIterable, Identifiable {
    case land
    case air
    case sea
    case all
    
    var id: APType {
        self
    }
    
    var background: Color {
        switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        case .all:
            .black
        }
    }
    
    var icon: String {
        switch self {
        case .land:
            "square.stack.3d.up.fill"
        case .air:
            "leaf.fill"
        case .sea:
            "wind"
        case .all:
            "drop.fill"
        }
    }
}

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    

    
}
