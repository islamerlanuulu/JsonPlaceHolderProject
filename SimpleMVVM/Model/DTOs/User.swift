//
//  Users.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import Foundation

struct User: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
}


