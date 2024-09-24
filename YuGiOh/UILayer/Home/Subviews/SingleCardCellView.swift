//
//  SingleCardCellView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import SwiftUI

struct SingleCardCellView: View {
    
    let singleCard: Card?
    
    var body: some View {
        
        LabeledContent {
            
            CardImageView(
                imageLink: singleCard?.cardImages.first?.imageURL,
                cardImageSize: (width: 130, height: 150)
            )
            
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
