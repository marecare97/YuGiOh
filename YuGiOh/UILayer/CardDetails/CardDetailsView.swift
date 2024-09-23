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
            
            Text("\(card?.name ?? "")")
            
        }
        
    }
    
    var header: some View {
        
        HStack {
            
            Spacer()
            
            Image(systemSymbol: .arrowBackward)
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    viewModel.goBack()
                }

        }
    }
}

#Preview {
    CardDetailsView(card: nil)
}
