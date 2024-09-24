//
//  TabCoordinator.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 24.9.24..
//

import Foundation
import Stinsen
import SwiftUI
import SFSafeSymbols

final class TabCoordinator: TabCoordinatable {
    
    var child = TabChild(
        startingItems: [
            \TabCoordinator.home,
             \TabCoordinator.profile
        ]
    )
    
    @Route(tabItem: makeHomeTab) var home = makeHome
    
    @Route(tabItem: makeProfileTab) var profile = makeProfile
    
}

extension TabCoordinator {
    
    func makeHome() -> HomeCoordinator {
        return HomeCoordinator()
    }
    
    @ViewBuilder func makeHomeTab(isActive: Bool) -> some View {
        Image(systemSymbol: isActive ? .houseFill : .house)
        Text("Home")
    }
    
    func makeProfile() -> ProfileCoordinator {
        return ProfileCoordinator()
    }
    
    @ViewBuilder func makeProfileTab(isActive: Bool) -> some View {
        Image(systemSymbol: isActive ? .personFill : .person)
        Text("Profile")
    }
    
}
