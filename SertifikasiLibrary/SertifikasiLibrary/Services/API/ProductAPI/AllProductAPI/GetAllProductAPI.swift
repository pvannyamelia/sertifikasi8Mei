//
//  GetAllProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation

extension AllProductAPI {
    func getAllProduct(completion: @escaping ()->()) {
        let task = URLSession.shared.dataTask(with: URL(string: self.getAllProductURL)!) { data, response, error  in
            guard let data = data, error == nil else {
                print(error.debugDescription)
                return
            }
                // parse JSON
            self.parseJSON(data: data)
            completion()
        }
        task.resume()
    }
    
    func parseJSON(data: Data) {
        let productsResponse: [Product] = try! JSONDecoder().decode([Product].self, from: data)
        self.productArray = productsResponse
    }
}
