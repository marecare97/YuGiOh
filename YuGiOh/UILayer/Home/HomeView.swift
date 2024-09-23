//
//  HomeView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Card Database")
                .font(.title)
                .fontWeight(.bold)
            
            cardsList
            
        }
        .task {
            await viewModel.getAllCards()
        }
        .overlay(viewModel.isLoading ? YuGiOhLoaderView() : nil)
        .background(.themeWhite)
    }
    
    var cardsList: some View {
        ScrollView {
            LazyVStack {
                
                ForEach(viewModel.allCards, id: \.id) { card in
                    
                    SingleCardCellView(singleCard: card)
                        .onTapGesture {
                            viewModel.goToCardDetails(card)
                        }
                        .cornerRadius(5)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
