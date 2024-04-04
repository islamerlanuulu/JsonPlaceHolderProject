//
//  MainCell.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 4/4/24.
//

import UIKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainCell"
    
    private var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "name"
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var emailLabel: UILabel = {
        let view = UILabel()
        view.text = "email"
        view.textColor = .black
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var labelsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    private func setupView() {
         addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20) 
        ])
    }
    
    func setupCell(_ viewmodel: MainCellViewModel) {
        self.nameLabel.text = viewmodel.name
        self.emailLabel.text = viewmodel.email
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
