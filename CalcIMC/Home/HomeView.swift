//
//  HomeView.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 12/09/24.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Cálculo do IMC"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptonLable: UILabel = {
        let label = UILabel()
        label.text = "Descubra seu índice de massa corporal"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weightLable: UILabel = {
        let label = UILabel()
        label.text = "Peso (Kg)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heightLable: UILabel = {
        let label = UILabel()
        label.text = "Altura (m)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Peso"
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Altura"
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setElementsVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementsVisual() {
        setTitleLable()
        setDescriptionLabel()
        setWeightConstraints()
        setHeightLableConstraints()
    }
    
    private func setTitleLable() {
        self.addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    private func setDescriptionLabel() {
        self.addSubview(descriptonLable)
        
        NSLayoutConstraint.activate([
            descriptonLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            descriptonLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptonLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setWeightConstraints() {
        self.addSubview(weightLable)
        self.addSubview(weightTextField)
        
        NSLayoutConstraint.activate([
            weightLable.topAnchor.constraint(equalTo: descriptonLable.bottomAnchor, constant: 20),
            weightLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            weightTextField.topAnchor.constraint(equalTo: weightLable.bottomAnchor, constant: 8),
            weightTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            weightTextField.widthAnchor.constraint(equalTo: weightLable.widthAnchor)

        ])
    }
    
    private func setHeightLableConstraints() {
        self.addSubview(heightLable)
        self.addSubview(heightTextField)
        
        NSLayoutConstraint.activate([
            heightLable.topAnchor.constraint(equalTo: descriptonLable.bottomAnchor, constant: 20),
            heightLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            heightTextField.topAnchor.constraint(equalTo: heightLable.bottomAnchor, constant: 8),
            heightTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            heightTextField.widthAnchor.constraint(equalTo: heightLable.widthAnchor)
        ])
    }
}

