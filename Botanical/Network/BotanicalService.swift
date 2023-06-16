//
//  BotanicalService.swift
//  Botanical
//
//  Created by Erick Lozano Borges on 16/06/23.
//

import Foundation

struct BotanicalService {
    
    private let apiKey = ""
    private let client: APICLient
    
    init(client: APICLient = .init()) {
        self.client = client
    }
    
    func getPlantList(page: Int = 1) async throws -> PlantListPage {
        let url = URL(string: "https://perenual.com/api/species-list")!
        let params = ["key": apiKey, "page": String(page)]
        return try await client.makeRequest(.get, url: url, query: params)
    }
}
