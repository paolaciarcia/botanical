//
//  PlantCollectionView.swift
//  Botanical
//
//  Created by Paola Golombieski Ciarcia on 13/06/23.
//

import Foundation
import SwiftUI

struct PlantCollectionView: View {
    
    @State var plants: [PlantModel] = []
    @State private var searchText = ""
    
    let service = BotanicalService()

    let colums = [
        GridItem(.adaptive(minimum: 100), spacing: 24, alignment: .top)
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: colums, spacing: 16) {
                    ForEach(plants) { plant in
                        VStack {
                            Image("placeholder-plant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(100)

                                .overlay {
                                    RoundedRectangle(cornerRadius: 100, style: .continuous)
                                        .stroke(Color.green, lineWidth: 4)
                                }

                            Text(plant.name)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("Avenir Medium", size: 22))
                                .foregroundColor(Color.black)

                            Text(plant.scientificName)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("Arial Rounded MT", size: 18))
                                .foregroundColor(.gray)
                                
                        }
                    }
                }
                .padding()

            }
            .navigationTitle("Plants")
        }
        .searchable(text: $searchText)
        .onAppear { getPlantList() }
    }
    
    private func getPlantList() {
        Task {
            do {
                let page = try await service.getPlantList()
                let items = page.data
                plants = items.map { PlantModel($0) }
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}

struct PlantCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        let plantArray = [
            PlantModel(id: 1, name: "Red Rhapsody Amur Maple", scientificName: "Acer ginnala 'Mondy", thumbnailUrl: ""),
            PlantModel(id: 2, name: "Red Rhapsody Amur Maple", scientificName: "Acer ginnala 'Mondy", thumbnailUrl: ""),
            PlantModel(id: 3, name: "Red Rhapsody Amur Maple", scientificName: "Acer ginnala 'Mondy", thumbnailUrl: ""),
            PlantModel(id: 4, name: "Red Rhapsody Amur Maple", scientificName: "Acer ginnala 'Mondy", thumbnailUrl: "")
        ]
        PlantCollectionView(plants: plantArray)
    }
}
