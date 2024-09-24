//
//  ProfileCoordinator.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 24.9.24..
//

import Foundation
import Stinsen
import SwiftUI

final class ProfileCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \ProfileCoordinator.start)
    
    @Root var start = makeStart
    
    @ViewBuilder func makeStart() -> some View {
        ProfileView()
    }
    
}
