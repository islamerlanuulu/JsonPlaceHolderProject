//
//  DetailsViewController.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 4/4/24.
//

import UIKit

class DetailsViewController: UIViewController {
        
    private let nameLabel = CustomLabel(text: "name", color: .black, font: .systemFont(ofSize: 17, weight: .bold))
    private let usernameLabel = CustomLabel(text: "username", color: .black, font: .systemFont(ofSize: 14, weight: .medium))
    private let emailLabel = CustomLabel(text: "email", color: .black, font: .systemFont(ofSize: 14, weight: .medium))
    private let phoneLabel = CustomLabel(text: "phone", color: .black, font:.systemFont(ofSize: 14, weight: .medium) )
    
    private let streetLabel = CustomLabel(text: "street", color: .black, font: .systemFont(ofSize: 14, weight: .medium))
    private let suiteLabel = CustomLabel(text: "suite", color: .black, font: .systemFont(ofSize: 14, weight: .medium) )
    private let cityLabel = CustomLabel(text: "city", color: .black, font: .systemFont(ofSize: 14, weight: .medium))

    private var labelsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let detailsViewModel: DetailsViewModel
    
    
    init(_ detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
        setupConstraints()
        displayUserInfo() 
    }
    
    private func setupView() {
        title = detailsViewModel.username
        view.backgroundColor = .white
        view.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(usernameLabel)
        labelsStackView.addArrangedSubview(emailLabel)
        labelsStackView.addArrangedSubview(phoneLabel)
        labelsStackView.addArrangedSubview(streetLabel)
        labelsStackView.addArrangedSubview(suiteLabel)
        labelsStackView.addArrangedSubview(cityLabel)
    }
    
    private func displayUserInfo() {
        nameLabel.text = "Name: \(detailsViewModel.name)"
        usernameLabel.text = "Username: \(detailsViewModel.username)"
        emailLabel.text = "Email: \(detailsViewModel.email)"
        phoneLabel.text = "Phone: \(detailsViewModel.phone)"
        
        streetLabel.text = "Street: \(detailsViewModel.street)"
        suiteLabel.text = "Suite: \(detailsViewModel.suite)"
        cityLabel.text = "City: \(detailsViewModel.city)"
    }
}


//MARK: - Setup Constraints
extension DetailsViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
}
