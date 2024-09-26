//
//  AppDependenciesContainer.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 26.9.24..
//

import Foundation
import TinyNetworking

final class AppDependenciesContainer {
    
    private static var cache: [String: Any] = [:]
    
    private static var factories: [String: () -> Any] = [:]
    
    static let shared = AppDependenciesContainer()
    
    func createDependencies() {
        
        let tinyNetworking = TinyNetworking<APIRequest>()
        
        Self.register(type: TinyNetworking<APIRequest>.self, tinyNetworking)
        
    }
    
}

extension AppDependenciesContainer {
    
    static func register<T>(type: T.Type, as dependencyType: DependencyType = .automatic, _ factory: @autoclosure @escaping () -> T) {
        
        factories[String(describing: type.self)] = factory
        
        if dependencyType == .singleton {
            cache[String(describing: type.self)] = factory()
        }
    }
    
    static func resolve<T>(dependencyType: DependencyType = .automatic, _ type: T.Type) -> T? {
        
        let key = String(describing: type.self)
        
        switch dependencyType {
            
        case .singleton:
            guard let cachedInstance = cache[key] as? T else {
                
                fatalError("\(key) is not registered as a Singleton")
            }
            
            return cachedInstance
            
        case .automatic:
            if let cachedInstance = cache[key] as? T {
                return cachedInstance
            }
            
            fallthrough
            
        case .newInstance:
            if let instance = factories[key]?() as? T {
                
                cache[key] = instance
                
                return instance
                
            } else {
                
                return nil
            }
        }
    }
}
