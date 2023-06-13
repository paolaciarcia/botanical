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
        GridItem(.adaptive(minimum: 170))
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: colums, spacing: 22) {
                ForEach(0...300, id: \.self) { _ in
                    Color.red.frame(width: 170, height: 170)
                    Color.green.frame(width: 170, height: 170)
                }
            }
            .padding()
        }
    }
}


struct PlantCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        PlantCollectionView()
    }
}
