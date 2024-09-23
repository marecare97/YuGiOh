//
//  HomeViewModel.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import Foundation
import TinyNetworking
import Stinsen

final class HomeViewModel: ObservableObject {
    
    @RouterObject
    var homeRouter: HomeCoordinator.Router?
    let tinyNetworking = TinyNetworking<APIRequest>()
    
    @Published var allCards: [Card] = []
    @Published var isLoading = true
    
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
                print(cardsResponse)
                
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
}
