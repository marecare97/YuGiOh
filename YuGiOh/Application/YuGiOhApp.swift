//
//  YuGiOhApp.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import SwiftUI

@main
struct YuGiOhApp: App {
    
    let appDIContainer: AppDependenciesContainer
    
    init() {
        let container = AppDependenciesContainer()
        self.appDIContainer = container
        self.appDIContainer.createDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            AppCoordinator().view()
        }
    }
}
