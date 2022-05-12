//
//  EditProductAPI.swift
//  SertifikasiLibrary
//
//  Created by Priscilla Vanny Amelia on 10/05/22.
//

import Foundation

extension ProductAPI {
    func editProduct(product: Product, completion: @escaping()->()) {
        let postString = "id_ctg=\(product.id_ctg)&product_name=\(product.product_name)&id_product=\(product.id_product)"
        guard let request = APIRequest.shared.postRequest(urlString: self.updateProductURL, postString: postString) else {
            return
        }
        
        // hit request
        if(!product.product_name.isEmpty && product.id_ctg != "0"){
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data=data, error == nil else {
                    return
                }

                self.parseJSON(data: data)
                completion()
            }
            task.resume()
        } else {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data=data, error == nil else {
                    return
                }

                self.parseJSON(data: data)
                completion()
            }
            task.resume()
        }
    }
}
