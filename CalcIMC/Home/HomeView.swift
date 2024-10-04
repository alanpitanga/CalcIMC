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
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptonLable: UILabel = {
        let label = UILabel()
        label.text = "Descubra seu índice de massa corporal"
        label.textColor = .white
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
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Altura"
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    lazy var calculateButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(UIColor(red: 0, green: 120, blue: 203, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var containerResultView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleResultLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.text = "Seu Índice de Massa Corpórea é "
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var resultLabel: UILabel = {
       let label = UILabel()
        label.text = "teste"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var resultImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        setCalculateButton()
        setContainerResultView()
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
    
    private func setCalculateButton() {
        self.addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 10),
            calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)

        ])
        
    }
    
    private func setContainerResultView() {
        self.addSubview(containerResultView)
        self.addSubview(titleResultLabel)
        self.addSubview(resultLabel)
        self.addSubview(resultImageView)
        
        NSLayoutConstraint.activate([
            containerResultView.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 30),
            containerResultView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerResultView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerResultView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            titleResultLabel.topAnchor.constraint(equalTo: containerResultView.topAnchor, constant: 10),
            titleResultLabel.leadingAnchor.constraint(equalTo: containerResultView.leadingAnchor, constant: 10),
            titleResultLabel.trailingAnchor.constraint(equalTo: containerResultView.trailingAnchor, constant: -10),
            
            resultLabel.topAnchor.constraint(equalTo: titleResultLabel.bottomAnchor, constant: 10),
            resultLabel.leadingAnchor.constraint(equalTo: containerResultView.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: containerResultView.trailingAnchor, constant: -10),
            
            resultImageView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            resultImageView.leadingAnchor.constraint(equalTo: containerResultView.leadingAnchor, constant: 10),
            resultImageView.trailingAnchor.constraint(equalTo: containerResultView.trailingAnchor, constant: -10),
            resultImageView.bottomAnchor.constraint(equalTo: containerResultView.bottomAnchor, constant: -10),
        ])
    }
}

