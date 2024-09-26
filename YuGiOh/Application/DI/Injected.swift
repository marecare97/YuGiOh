//
//  Injected.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 26.9.24..
//

import Foundation

@propertyWrapper
struct Injected<T> {
    
    var instance: T
    
    init(_ dependencyType: DependencyType = .newInstance) {
        
        guard let instance = AppDependenciesContainer.resolve(dependencyType: dependencyType, T.self) else {
            
            fatalError("Dependency of type \(String(describing: T.self)) not registered")
            
        }
        
        self.instance = instance
        
    }
    
    var wrappedValue: T {
        get { self.instance }
        mutating set { self.instance = newValue }
    }
    
}

enum DependencyType {
    
    case singleton
    case newInstance
    case automatic
    
}
