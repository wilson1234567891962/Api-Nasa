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
    func didSelectItem(item: DetailModel) {
        if let url = URL(string: item.url ??  "https://apod.nasa.gov/apod/image/2007/msv1000crop.jpg") {
            UIApplication.shared.open(url)
        }
    }
    
    func filterData(word: String) {
        if(word.isEmpty){
            self.detailView.tableView.setup(itemsDetail: self.items)
            return
        }
        
        let resultArray = self.items.filter {
                  $0.date!.contains(word)
        }
        self.detailView.tableView.setup(itemsDetail: resultArray)
    }
    
    
  // MARK: - Properties
  private lazy var detailView: DetailView = {
      let view = DetailView(delegate: self)
      return view
  }()

  private var items: [DetailModel]

  // MARK: - init
  init() {
      self.items = Array()
      super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  // MARK: - View Life Cycle
  override func loadView() {
      super.loadView()
      self.callServices()
      view = detailView
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      setupNavigationBar()
  }
  
  override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      setupNavigationBar()
      self.detailView.tableView.setup(itemsDetail: items)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      navigationItem.title = ""
  }
    
  private func setupNavigationBar() {
  }
  
  private func goBack(sender: UIViewController? = nil) {
     
  }
    
  private var service = Services()
    
    func callServices(){
        let group = DispatchGroup()
        group.enter()
        self.service.getData{ data, error in
            self.items = data
            group.leave()
        }
        group.wait()
    }
}

