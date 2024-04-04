//
//  MainViewController + TableView.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func setupTableView() {}
    
     func reloadTableView() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier:  MainCell.identifier, for: indexPath) as? MainCell else {
            fatalError("Error TableView")
        }
        
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightRoat()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSourse = viewModel.dataSource else { return }
        presentDetailsViewController(user: dataSourse[indexPath.row])
    }
}
