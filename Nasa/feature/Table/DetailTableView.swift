//
//  DetailTableView.swift
//  Nasa
//
//  Created by Wilson Alejandro Gonzalez Gaitan on 5/07/20.
//  Copyright © 2020 Alejandro Gonzalez. All rights reserved.
//


import Foundation
import SnapKit

class DetailTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private var items: [DetailModel] = []
    private var delegateDetail: DetailViewDelegate?
    
    // MARK: - init
    init(delegate: DetailViewDelegate? ) {
        super.init(frame: CGRect.zero, style: UITableView.Style.plain)
        self.delegate = self
        self.delegateDetail = delegate
        self.dataSource = self
        self.backgroundColor = .white
        register(cellType: DetailTableViewCell.self)
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup TableView
    func setup(itemsDetail: [DetailModel]) {
        self.items = itemsDetail
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailTableViewCell.self)
        cell.bind(delegate : self.delegateDetail)
        cell.setItemModel(item : self.items[indexPath.row])
        cell.configure(with: card)
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return TittleHeaderView(delegate: self.delegateDetail)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
