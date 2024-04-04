//
//  URLSession + Extensions.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import Foundation

extension URLSession {
    typealias Handler = (Data?, URLResponse?, Error? ) -> Void
    
    @discardableResult
    func request(_ endPoint: EndPoint, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endPoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}
