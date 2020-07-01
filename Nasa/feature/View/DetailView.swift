//
//  DetailView.swift
//  Nasa
//
//  Created by Wilson Alejandro Gonzalez Gaitan on 30/06/20.
//  Copyright © 2020 Alejandro Gonzalez. All rights reserved.
//

import Foundation
import UIKit

import SnapKit


class DetailView: UIView {
    
    private weak var delegate: DetailViewDelegate?

    // MARK: - init

    private(set) lazy var detailView: UIView = {
         let view = UIView()
         return view
     }()
    
    init(delegate: DetailViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

