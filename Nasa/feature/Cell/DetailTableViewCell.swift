//
//  DetailTableViewCell.swift
//  Nasa
//
//  Created by Wilson Alejandro Gonzalez Gaitan on 5/07/20.
//  Copyright © 2020 Alejandro Gonzalez. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Reusable

class DetailTableViewCell: UITableViewCell, Reusable {
    
    private var item: DetailModel
    
    // MARK: - Properties
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var containerSubItem: UIStackView = {
             let stackView = UIStackView()
             stackView.axis = .vertical
             return stackView
    }()
    
    private lazy var subContainerView: UIView = {
            let cardContainerView = UIView()
            return cardContainerView
    }()
    
    private lazy var titleHeader: UILabel = {
           let label = UILabel()
           label.textColor = .red
           label.numberOfLines = 2
           return label
    }()
    
    private lazy var valueTitle: UILabel = {
           let label = UILabel()
           label.textColor = .black
           label.numberOfLines = 2
           return label
    }()
    
    private lazy var dateHeader: UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
       
    private lazy var dateValue: UILabel = {
       let label = UILabel()
       label.textColor = .black
       return label
    }()
    
    private lazy var detailButton: UIButton = {
         let button = UIButton()
         button.setTitle("Ver detalle", for: .normal)
         button.setTitleColor(.blue, for: .normal)
         button.addTarget(self, action: #selector(showDetail), for: .touchUpInside)
         return button
    }()
       
    private lazy var lineSeparator: UIView = {
           let view = UIView()
           view.backgroundColor = .black
           return view
    }()
    

    private var delegateDetail: DetailViewDelegate?
    
    func bind(delegate: DetailViewDelegate? ) {
      self.delegateDetail = delegate
    }
    
    func setItemModel(item: DetailModel) {
      self.item = item
    }
    
    func showDetailEvent(delegate: DetailViewDelegate? ) {
         self.delegateDetail = delegate
    }

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.item = DetailModel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showDetail() {
       self.delegateDetail?.didSelectItem(item: self.item)
    }
}

// MARK: - View Configuration

extension DetailTableViewCell: ViewConfiguration {
    func configureViews() {
        backgroundColor = .white
    }
    
    func configure(with model: DetailModel) {
               backgroundColor = .white
               titleHeader.text = "Titulo: "
               valueTitle.text = model.title
               dateHeader.text = "Fecha: "
               dateValue.text =  model.date
    }
    
    func buildViewHierarchy() {
               addSubview(containerStackView)
               addSubview(containerSubItem)
               addSubview(lineSeparator)
           
               containerSubItem.addArrangedSubview(subContainerView)
               
               subContainerView.addSubview(titleHeader)
               subContainerView.addSubview(valueTitle)
               subContainerView.addSubview(dateHeader)
               subContainerView.addSubview(dateValue)
               subContainerView.addSubview(detailButton)
    }
    
    func setupConstraints() {
        
           containerStackView.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(23)
                make.trailing.equalToSuperview().offset(-19)
            }
            
           containerSubItem.snp.makeConstraints { (make) in
                make.height.equalTo(69)
                make.top.equalToSuperview().offset(24)
                make.leading.equalToSuperview().offset(15)
                make.trailing.equalToSuperview().offset(-66)
                make.bottom.equalTo(subContainerView.snp.top).offset(-20)
            }
            
            subContainerView.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(15)
                make.trailing.equalToSuperview().offset(-66)
                make.bottom.equalTo(self.snp.bottomMargin).offset(-24)
            }
          
            titleHeader.snp.makeConstraints { (make) in
                make.height.equalTo(16)
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalTo(valueTitle.snp.leading).offset(-8)
                make.bottom.equalTo(dateHeader.snp.top).offset(-8)
            }
            
            valueTitle.snp.makeConstraints { (make) in
                make.height.equalTo(16)
                make.top.equalToSuperview()
                make.trailing.equalToSuperview()
                make.bottom.equalTo(dateValue.snp.top).offset(-8)
            }
            
            
            dateHeader.snp.makeConstraints { (make) in
                make.height.equalTo(16)
                make.leading.equalToSuperview()
                make.trailing.equalTo(dateValue.snp.leading).offset(-6)
            }
                   
            dateValue.snp.makeConstraints { (make) in
                 make.height.equalTo(16)
                 make.trailing.equalToSuperview()
            }
            
            detailButton.snp.makeConstraints { (make) in
                make.top.equalTo(dateValue.snp.top)
                make.trailing.equalToSuperview()
                make.height.equalTo(64)
            }
            
            lineSeparator.snp.makeConstraints { (make) in
                make.leading.trailing.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
    }
}
