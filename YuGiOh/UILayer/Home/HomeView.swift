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
            
            topBar
            
            cardsList
            
        }
        .task {
            await viewModel.getAllCards()
        }
        .overlay(viewModel.isLoading ? YuGiOhLoaderView() : nil)
        .background(.themeWhite)
    }
    
    var topBar: some View {
        
        HStack {
            
            Text("Card Database")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemSymbol: .line3HorizontalDecreaseCircle)
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    self.viewModel.goToCardFilters(viewModel: self.viewModel)
                }
            
        }
        
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
