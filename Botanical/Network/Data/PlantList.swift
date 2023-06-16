//
//  PlantListPage.swift
//  Botanical
//
//  Created by Erick Lozano Borges on 16/06/23.
//

import Foundation

struct PlantListPage: Decodable {
    let data: [PlantListItem]
}

struct PlantListItem: Decodable {
    let id: Int
    let commonName: String
    let scientificName: [String]
    let defaultImage: PlantImage
}

struct PlantImage: Decodable {
    let thumbnail: String
}
