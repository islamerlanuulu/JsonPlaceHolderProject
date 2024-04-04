//
//  CustomLabel.swift
//  SimpleMVVM
//
//  Created by Islammmm <3 on 4/4/24.
//

import UIKit

class CustomLabel: UILabel {

    // MARK: - Properties

    var customColor: UIColor {
        didSet {
            textColor = customColor
        }
    }

    var customFont: UIFont {
        didSet {
            font = customFont
        }
    }

    // MARK: - Initialization

    init(text: String? = nil, color: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 17)) {
        self.customColor = color
        self.customFont = font
        super.init(frame: .zero)
        self.text = text
        setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabel() {
        textColor = customColor
        font = customFont
        translatesAutoresizingMaskIntoConstraints = false
    }
}

