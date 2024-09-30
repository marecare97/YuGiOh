//
//  HomeCoordinator.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 17.8.24..
//

import Foundation
import Stinsen
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \HomeCoordinator.start)
    
    @Root var start = makeStart
    
    @Route(.modal) var cardDetails = makeCardDetails
    
    @Route(.modal) var cardFilters = makeCardFilters
    
    @ViewBuilder func makeStart() -> some View {
        HomeView(viewModel: HomeViewModel())
    }
    
    @ViewBuilder func makeCardDetails(card: Card) -> some View {
        CardDetailsView(card: card)
    }
    
    @ViewBuilder func makeCardFilters(viewModel: HomeViewModel) -> some View {
        CardFiltersView(viewModel: viewModel)
    }
}
