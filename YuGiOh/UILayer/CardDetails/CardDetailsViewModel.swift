//
//  CardDetailsViewModel.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 17.8.24..
//

import Foundation
import Stinsen

final class CardDetailsViewModel: ObservableObject {
    
    @RouterObject
    var homeRouter: HomeCoordinator.Router?
    
}


// MARK: Navigation
extension CardDetailsViewModel {
    
    func goBack() {
        self.homeRouter?.pop()
    }
}
