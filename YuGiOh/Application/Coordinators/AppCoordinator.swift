//
//  AppCoordinator.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 17.8.24..
//

import Foundation
import Stinsen
import SwiftUI

final class AppCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \AppCoordinator.start)
    
    @Root var start = makeMain
    
    @Route(.push) var main = makeMain
    
    func makeMain() -> TabCoordinator {
        return TabCoordinator()
    }
}
