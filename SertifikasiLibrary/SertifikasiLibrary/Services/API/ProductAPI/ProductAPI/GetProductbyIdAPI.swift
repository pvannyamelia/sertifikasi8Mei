//
//  GetProductbyIdAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation

extension ProductAPI {
    func getProductbyProductID(productId: String, completion: @escaping ()->()) {
        let task = URLSession.shared.dataTask(with: URL(string: "\(self.getProductbyIDURL)\(productId)")!) { data, response, error in
            guard let data = data, error == nil else {
                print("Something's wrong")
                return
            }
            
            self.parseGetJSON(data: data)
            completion()
        }
        task.resume()
    }
    
    func parseGetJSON(data: Data) {
        let productResponse: Product = try! JSONDecoder().decode(Product.self, from: data)
        self.product = productResponse
    }
}
