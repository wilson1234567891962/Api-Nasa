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
       print(item)
    }
        
   private var items: [DetailModel] = Array()

   private lazy var detailView: DetailView = {
           let view = DetailView(delegate: self)
           return view
    }()
    
      // MARK: - init
    init(){
        let test: String = "{\"url\":\"https://api.nasa.gov/planetary/apod/static/default_apod_image.jpg\"}"
        if let jsonData = test.data(using: .utf8){
           let detailModel:DetailModel = try! JSONDecoder().decode(DetailModel.self, from: jsonData)
            var temp = Array<DetailModel>()
            temp.append(detailModel)
            temp.append(detailModel)
            temp.append(detailModel)
            temp.append(detailModel)
            temp.append(detailModel)
            temp.append(detailModel)
                 temp.append(detailModel)
            temp.append(detailModel)
                 temp.append(detailModel)
            temp.append(detailModel)
                 temp.append(detailModel)
            temp.append(detailModel)
                 temp.append(detailModel)
            self.items = temp
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.setupView(cards: self.items)
        self.view = detailView
        view.backgroundColor = .white
    }
}





