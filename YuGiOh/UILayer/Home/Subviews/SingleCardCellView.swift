//
//  SingleCardCellView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import SwiftUI
import Kingfisher

struct SingleCardCellView: View {
    
    let singleCard: Card?
    
    var body: some View {
        
        LabeledContent {
            
            if let imageURLString = singleCard?.cardImages.first?.imageURL,
               let url = URL(string: imageURLString) {
                
                KFImage(url)
                    .placeholder{
                        Image(.cardBack)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 150)
                            .clipped()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 150)
                    .clipped()
                
            }
            
        } label: {
            Text(singleCard?.name ?? "")
                .font(.title3)
                .bold()
                .foregroundStyle(.themeBlue)
        }
        .padding()
        .background(.themeYellow)
    }
}

#Preview {
    SingleCardCellView(singleCard: nil)
}
