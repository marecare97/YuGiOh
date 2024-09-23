//
//  APIRequest.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 15.8.24..
//

import Foundation
import TinyNetworking

enum APIRequest {
    case getAllCards
}

extension APIRequest: Resource {
    
    var baseURL: URL {
        return URL(string: "https://db.ygoprodeck.com/api/v7")!
    }
    
    var endpoint: Endpoint {
        switch self {
        case .getAllCards:
            return .get(path: "/cardinfo.php")
        }
    }
    
    var task: Task {
        let params: [String: Any] = [:]
        return .requestWithParameters(params, encoding: URLEncoding())
    }
    
    var headers: [String: String] {
        return ["Authorization": "Bearer xxx"]
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
    
}
