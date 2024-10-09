//
//  TextFieldDefalt.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 03/10/24.
//

import Foundation
import UIKit

class TextFieldDefault: UITextField {
    init(text: String) {
        super.init(frame: .zero)
        initDefault(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String){
        
        self.placeholder = text
        self.textAlignment = .center
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false

    }
}
