//
//  PlantModel.swift
//  Botanical
//
//  Created by Paola Golombieski Ciarcia on 16/06/23.
//

import SwiftUI

struct PlantModel: Identifiable {
    let id: Int
    let name: String
    let scientificName: String
    let thumbnailUrl: String
    
    init(id: Int, name: String, scientificName: String, thumbnailUrl: String) {
        self.id = id
        self.name = name
        self.scientificName = scientificName
        self.thumbnailUrl = thumbnailUrl
    }
    
    init(_ listItem: PlantListItem) {
        self.id = listItem.id
        self.name = listItem.commonName
        self.scientificName = listItem.scientificName.first ?? ""
        self.thumbnailUrl = listItem.defaultImage.thumbnail
    }
}
