//
//  LabelDefault.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 03/10/24.
//

import Foundation
import UIKit

class LabelDefault: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: UIFont.systemFont(ofSize: 17), textColor: .white)
    }
    
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: font, textColor: .white)
    }
    
    init(text: String, font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: font, textColor: textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String, font: UIFont, textColor: UIColor) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
