//
//  PlantCollectionView.swift
//  Botanical
//
//  Created by Paola Golombieski Ciarcia on 13/06/23.
//

import Foundation
import SwiftUI

struct PlantCollectionView: View {
    let colums = [
        GridItem(.adaptive(minimum: 100), spacing: 24)
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: colums, spacing: 16) {
                    ForEach(0...60, id: \.self) { _ in
                        VStack {
                            Image("placeholder-plant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(100)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 100, style: .continuous)
                                        .stroke(Color.green, lineWidth: 4)
                                }

                            Text("New Plant")
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
        
    }
}


struct PlantCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        PlantCollectionView()
    }
}
