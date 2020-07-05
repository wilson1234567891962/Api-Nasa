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
        let resultArray = self.items.filter {
            $0.date!.contains(word)
        }
         print(resultArray)
   }
    
   private var items: [DetailModel] = Array()
   private var service = Services()
  
   private lazy var detailView: DetailView = {
           let view = DetailView(delegate: self)
           return view
    }()
    
      // MARK: - init
    init(){
        self.items = Array()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callServices()
        detailView.setupView(items: self.items)
        self.view = detailView
        view.backgroundColor = .white
    }
    
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

