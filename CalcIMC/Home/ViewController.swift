//
//  ViewController.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 09/09/24.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    lazy var homeView: HomeView = {
        let view = HomeView()
        view.backgroundColor = .white
    return view
    }()
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

