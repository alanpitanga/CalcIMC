//
//  HomeView.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 12/09/24.
//

import Foundation
import UIKit

protocol HomeViewProtocol where Self: UIView {
    func setup(delegate:HomeViewDelegate)
    func render(_ viewModel: HomeViewModel)
}

protocol HomeViewDelegate: AnyObject {
    func touchButton()
}

final class HomeView: UIView, HomeViewProtocol {
    
    lazy var titleLable = LabelDefault(text: "Cálculo do IMC", font: UIFont.systemFont(ofSize: 36, weight: .heavy))
    
    lazy var descriptonLable = LabelDefault(text: "Descubra seu índice de massa corporal", font: UIFont.systemFont(ofSize: 15, weight: .light), textColor: .black)
    
    lazy var weightLable = LabelDefault(text: "Peso (Kg)")
    
    lazy var heightLable = LabelDefault(text: "Altura (m)")
    
    lazy var weightTextField = TextFieldDefault(text: "Peso")
    
    lazy var heightTextField = TextFieldDefault(text: "Altura")
    
    lazy var calculateButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(UIColor(red: 0, green: 177, blue: 189, alpha: 1), for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private weak var delegate: HomeViewDelegate?
    
    lazy var containerResultView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleResultLabel = LabelDefault(text: "Seu Índice de Massa Corpórea é ", font: UIFont.boldSystemFont(ofSize: 17), textColor: .darkGray)
   
    lazy var resultLabel = LabelDefault(text: "teste", font: UIFont.boldSystemFont(ofSize: 25), textColor: .black)
    
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
            titleLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    private func setDescriptionLabel() {
        self.addSubview(descriptonLable)
        
        NSLayoutConstraint.activate([
            descriptonLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 20),
            descriptonLable.centerXAnchor.constraint(equalTo: titleLable.centerXAnchor)
        ])
    }
    
    private func setWeightConstraints() {
        self.addSubview(weightLable)
        self.addSubview(weightTextField)
        
        NSLayoutConstraint.activate([
            weightLable.topAnchor.constraint(equalTo: descriptonLable.bottomAnchor, constant: 20),
            weightLable.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -70),
            weightLable.widthAnchor.constraint(equalToConstant: 110),
            weightLable.heightAnchor.constraint(equalToConstant: 25),
           
            
            weightTextField.topAnchor.constraint(equalTo: weightLable.bottomAnchor, constant: 8),
            weightTextField.centerXAnchor.constraint(equalTo: weightLable.centerXAnchor),
            weightTextField.widthAnchor.constraint(equalTo: weightLable.widthAnchor),
            weightTextField.heightAnchor.constraint(equalTo: weightLable.heightAnchor)

        ])
    }
    
    private func setHeightLableConstraints() {
        self.addSubview(heightLable)
        self.addSubview(heightTextField)
        
        NSLayoutConstraint.activate([
            heightLable.topAnchor.constraint(equalTo: weightLable.topAnchor),
            heightLable.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 70),
            heightLable.widthAnchor.constraint(equalTo: weightLable.widthAnchor),
            heightLable.heightAnchor.constraint(equalTo: weightLable.heightAnchor),
            
            heightTextField.topAnchor.constraint(equalTo: heightLable.bottomAnchor, constant: 8),
            heightTextField.centerXAnchor.constraint(equalTo: heightLable.centerXAnchor),
            heightTextField.widthAnchor.constraint(equalTo: heightLable.widthAnchor),
            heightTextField.heightAnchor.constraint(equalTo: heightLable.heightAnchor)
        ])
    }
    
    private func setCalculateButton() {
        self.addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 14),
            calculateButton.leadingAnchor.constraint(equalTo: weightLable.leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: heightLable.trailingAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 44)

        ])
        
    }
    
    private func setContainerResultView() {
        self.addSubview(containerResultView)
        self.addSubview(titleResultLabel)
        self.addSubview(resultLabel)
        self.addSubview(resultImageView)
        
        NSLayoutConstraint.activate([
            containerResultView.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            containerResultView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerResultView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerResultView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            titleResultLabel.topAnchor.constraint(equalTo: containerResultView.topAnchor, constant: 16),
            titleResultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: titleResultLabel.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: containerResultView.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: containerResultView.trailingAnchor, constant: -16),
            
            resultImageView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 16),
            resultImageView.leadingAnchor.constraint(equalTo: containerResultView.leadingAnchor, constant: 16),
            resultImageView.trailingAnchor.constraint(equalTo: containerResultView.trailingAnchor, constant: -16),
            resultImageView.bottomAnchor.constraint(equalTo: containerResultView.bottomAnchor, constant: -16),
        ])
    }
    
    func setup(delegate: HomeViewDelegate) {
        self.delegate = delegate
    }
    
    func render(_ viewModel: HomeViewModel) {
        titleLable.text = viewModel.title
        descriptonLable.text = viewModel.description
        weightLable.text = viewModel.weightTitle
        heightLable.text = viewModel.heightTitle
        weightTextField.text = viewModel.weight
        heightTextField.text = viewModel.height
        calculateButton.setTitle(viewModel.button, for: .normal)
        titleResultLabel.text = viewModel.titleResult
        resultLabel.text = viewModel.result
        resultImageView.image = UIImage(named: viewModel.image)
    }
    
    @objc private func touchButton() {
        delegate?.touchButton()
        print("Touched")
    }
    
}

