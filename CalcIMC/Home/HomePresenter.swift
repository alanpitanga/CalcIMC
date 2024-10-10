//
//  HomePresenter.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 09/10/24.
//

import Foundation
import UIKit

protocol HomePresenterProtocol {
    func setup(view: HomeViewControllerProtocol)
}

protocol HomeViewControllerProtocol: AnyObject {
    
}

final class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewControllerProtocol?
    
    func setup(view: HomeViewControllerProtocol) {
        self.view = view
    }
}
