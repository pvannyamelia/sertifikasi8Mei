//
//  DeleteProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation

extension ProductAPI {
    func deleteProduct(productID: String, completion: @escaping()->()) {
        guard let url = URL(string: "\(self.deleteProductURL)\(productID)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Something's wrong")
                return
            }

            self.parseJSON(data: data)
            completion()
        }
        task.resume()
    }
}
