//
//  TittleHeaderView.swift
//  Nasa
//
//  Created by Wilson Alejandro Gonzalez Gaitan on 5/07/20.
//  Copyright © 2020 Alejandro Gonzalez. All rights reserved.
//
import UIKit
import SnapKit

class TittleHeaderView: UIView {
    
    // MARK: - Properties
    fileprivate(set) lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.text = "Detalle del servicio"
        title.textColor = .white
        title.textAlignment = .center
        title.backgroundColor = .black
        return title
    }()
    
    private lazy var inputTextField: UITextField = {
        let textInput = UITextField()
        textInput.backgroundColor = .white
        textInput.placeholder = "buscador"
        textInput.textAlignment = .center
        textInput.addTarget(self, action: #selector(filter), for: .editingChanged)
        return textInput
    }()
    
    // MARK: - init
    init(delegate: DetailViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    private var delegate: DetailViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func filter() {
       self.delegate?.filterData(word: self.inputTextField.text ?? "")
    }
    
}

// MARK: - View Configuration
extension TittleHeaderView: ViewConfiguration {
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(inputTextField)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.top.equalTo(self.snp.topMargin)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
        }
        
        inputTextField.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(32)
        }
    }
}
