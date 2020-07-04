//
//  Services.swift
//  Nasa
//
//  Created by Wilson Alejandro Gonzalez Gaitan on 4/07/20.
//  Copyright © 2020 Alejandro Gonzalez. All rights reserved.
//

import Foundation

class Services {
    
    func getData (completion: @escaping (_ dataDetail: Array<DetailModel>, _ error: Error?)->()) {
        var dataDetail = Array<DetailModel>()
        var currentDateTime = Date()
        let symbol = String("-")
           for n in 1...8 {
               let urlKey = "https://api.nasa.gov/planetary/apod?date=" + self.getFormattedDate(system: currentDateTime, formatter: "yyyy-MM-dd") + "&api_key=MfiHBbEJ4IPMI0osT9M1F5crnDLxf1HlFhfM5zvB";
                 let count = String(n)
                 let itemCount = symbol + count
                 currentDateTime=self.sumDate(system: currentDateTime, count: Int(itemCount) ?? n)
                 let url = URL(string: urlKey)!
                 let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                 guard let data = data else {
                    completion(dataDetail, error)
                    return
                 }
                 let convert = String(data: data, encoding: .utf8)!
                 if let jsonData = convert.data(using: .utf8){
                   let detailModel:DetailModel = try! JSONDecoder().decode(DetailModel.self, from: jsonData)
                   dataDetail.append(detailModel)
                   if(n == 8){
                       completion(dataDetail, error)
                   }
                 }
              }
              task.resume()
           }
       }
       
    func getFormattedDate(system: Date , formatter:String) -> String {
           let df = DateFormatter()
           df.dateFormat = formatter
           return df.string(from: system)
    }
    
    func sumDate(system: Date, count: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: count, to: Date()) ?? Date()
    }
    
}
