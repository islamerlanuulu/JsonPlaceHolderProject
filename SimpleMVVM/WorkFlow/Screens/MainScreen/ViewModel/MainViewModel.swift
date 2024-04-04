//
//  MainViewModel.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> =  Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSource: [User]?
    
    
    func numberOfSection() -> Int {
        1
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func heightRoat() -> CGFloat {
        80
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else {return }
            isLoading.value = false 
          if let users {
              self.dataSource = users
              mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.compactMap({ MainCellViewModel($0) })
    }
}
