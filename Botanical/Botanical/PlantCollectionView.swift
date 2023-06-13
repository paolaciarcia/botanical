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
        GridItem(.adaptive(minimum: 170), spacing: 16)
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: colums, spacing: 16) {
                ForEach(0...60, id: \.self) { _ in
                    // cell
                    ZStack {
                        Image("placeholder-plant")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        VStack {
                            Spacer()
                            Text("Botanical")
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(Gradient(colors: [.clear, .green]))
                        }
                    }
                    .cornerRadius(16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.green, lineWidth: 4)
                    }
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
