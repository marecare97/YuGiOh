//
//  CardImageView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 23.9.24..
//

import SwiftUI
import Kingfisher

struct CardImageView: View {
    
    var imageLink: String?
    var cardImageSize: (width: CGFloat?, height: CGFloat?)
    
    var body: some View {
        if let imageURLString = imageLink,
           let url = URL(string: imageURLString) {
            
            KFImage(url)
                .placeholder{
                    Image(.cardBack)
                        .resizable()
                        .scaledToFit()
                        .frame(width: cardImageSize.width, height: cardImageSize.height)
                        .clipped()
                }
                .resizable()
                .scaledToFit()
                .frame(width: cardImageSize.width, height: cardImageSize.height)
                .clipped()
            
        }
    }
}

#Preview {
    CardImageView(imageLink: "")
}
