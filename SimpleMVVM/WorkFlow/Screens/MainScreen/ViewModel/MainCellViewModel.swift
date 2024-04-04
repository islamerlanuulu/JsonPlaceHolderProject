//
//  MainCellViewModel.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 4/4/24.
//

import Foundation

class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: User) {
        self.name = user.username
        self.email = user.email
    }
}
