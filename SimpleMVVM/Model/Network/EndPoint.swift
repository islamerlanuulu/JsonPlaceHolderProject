//
//  EndPoint.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
       var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL Components \(components)")
        }
        return url
    }
}

extension EndPoint {
    static var users: Self {
        EndPoint(path: "users")
    }
}
