//
//  HomeViewModel.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import Foundation
import Stinsen
import TinyNetworking

final class HomeViewModel: ObservableObject {
    
    @RouterObject
    var homeRouter: HomeCoordinator.Router?
    
    @Injected var tinyNetworking: TinyNetworking<APIRequest>
    
    @Published var allCards: Cards = []
    @Published var filteredCards: Cards = []
    @Published var isLoading = true
    
    @Published var monsterCardSelectedRace = ""
    
}

// MARK: Data fetching
extension HomeViewModel {
    
    @MainActor
    func getAllCards() async {
        
        self.isLoading = true
        
        tinyNetworking.request(resource: .getAllCards) { result in
            switch result {
                
            case let .success(response):
                let cardsResponse = try? response.map(to: CardData.self)
                
                self.allCards = cardsResponse?.data ?? []
                self.isLoading = false
                
            case let .failure(error):
                self.isLoading = false
                print(error)
                
            }
        }
    }
}

// MARK: Navigation
extension HomeViewModel {
    
    func goToCardDetails(_ card: Card) {
        
        self.homeRouter?.route(to: \.cardDetails, card)
        
    }
    
    func goToCardFilters(viewModel: HomeViewModel) {
        
        self.homeRouter?.route(to: \.cardFilters, viewModel)
        
    }
}
