//
//  PlantCollectionView.swift
//  Botanical
//
//  Created by Paola Golombieski Ciarcia on 13/06/23.
//

import Foundation
import SwiftUI

struct PlantCollectionView: View {
    let plants = ["European Silver Fir",
                  "Pyramidalis Silver Fir",
                  "White Fir",
                  "Candicans White Fir"]

    @State private var searchText = ""

    let colums = [
        GridItem(.adaptive(minimum: 100), spacing: 24, alignment: .top)
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: colums, spacing: 16) {
                    ForEach(plants, id: \.self) { plant in
                        VStack {
                            Image("placeholder-plant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(100)

                                .overlay {
                                    RoundedRectangle(cornerRadius: 100, style: .continuous)
                                        .stroke(Color.green, lineWidth: 4)
                                }

                            Text(plant)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("Avenir Medium", size: 22))
                                .foregroundColor(Color.black)

                            Text("Plant Specie")
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
    }
}


struct PlantCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        PlantCollectionView()
    }
}
