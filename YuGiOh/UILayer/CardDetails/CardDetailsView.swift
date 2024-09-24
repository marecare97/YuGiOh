//
//  CardDetailsView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 17.8.24..
//

import SwiftUI
import SFSafeSymbols

struct CardDetailsView: View {
    
    @StateObject var viewModel = CardDetailsViewModel()
    
    let card: Card?
    
    var body: some View {
        
        VStack {
            
            header
            
            cardDetails
            
            Spacer()
            
        }
        
    }
    
    var header: some View {
        
        HStack {
            
            Text("\(card?.name ?? "")")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemSymbol: .xCircleFill)
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    viewModel.goBack()
                }
            
        }
        .padding()
    }
    
    var cardDetails: some View {
        
        HStack {
            
            CardImageView(
                imageLink: card?.cardImages.first?.imageURL,
                cardImageSize: (width: 230, height: 250)
            )
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Type")
                
                Text("\(card?.type ?? "")")
                
            }
            
        }
        
    }
    
}

#Preview {
    CardDetailsView(card: nil)
}
