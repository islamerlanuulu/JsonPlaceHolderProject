//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 3/4/24.
//

import UIKit

class MainViewController: UIViewController {
    
    internal lazy var tableview: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //MARK: - Register Cell
        view.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        //MARK: - Setup Delegate & DataSource
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    internal let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var viewModel = MainViewModel()
    var cellDataSource = [MainCellViewModel ]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
        setupConstraints()
        bindViewModel()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Main Screen"
        
        view.addSubview(tableview)
        view.addSubview(activityIndicator)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else { return }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    func presentDetailsViewController(user: User) {
        let detailViewModel = DetailsViewModel(user: user)
        let detailViewController = DetailsViewController(detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


//MARK: - Setup Constraints
extension MainViewController {
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
