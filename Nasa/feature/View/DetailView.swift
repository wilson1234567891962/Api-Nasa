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

    // MARK: - properties

    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        return view
    }()

    private(set) lazy var containerView: UIView = {
        let view = UIView()
        return view

    }()

    // MARK: - First section

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(24)
        label.backgroundColor = .black
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private weak var delegate: DetailViewDelegate?

    // MARK: - init


    init(delegate: DetailViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// MARK: - View Configuration

extension   DetailView: ViewConfiguration {

    func configureViews(){
        titleLabel.text = "Registros"
    }

    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
    }

    func setupConstraints() {

        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
        }
    }

}

