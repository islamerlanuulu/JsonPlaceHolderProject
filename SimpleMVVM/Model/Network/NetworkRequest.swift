//
//  NetworkRequest.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import Foundation

class NetworkRequest {
    static let  shared = NetworkRequest()
    
    private init() {}
    
    func getData(completionHandler : @escaping (Result<Data, NetworkError>) -> Void ) {
        URLSession.shared.request(.users) { data, _ , error in
            DispatchQueue.main.async {
                if error != nil  {
                    completionHandler(.failure(.urlError))
                } else {
                    guard let data else {return}
                    completionHandler(.success(data))
                }
            }
            
        }
        
    }
}

