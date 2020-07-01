//
//  DetailViewController.swift
//  Nasa
//
//  Created by Wilson Alejandro Gonzalez Gaitan on 30/06/20.
//  Copyright © 2020 Alejandro Gonzalez. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, DetailViewDelegate {
    
    private lazy var detailView: DetailView = {
        let view = DetailView(delegate: self)
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
